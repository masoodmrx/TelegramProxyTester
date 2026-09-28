import 'package:dio/dio.dart';

import '../../core/database/app_database.dart';
import '../../domain/proxy_models.dart';
import 'proxy_parser.dart';

class SourceSyncBusyException implements Exception {
  const SourceSyncBusyException();
}

class SourceSyncCancelledException implements Exception {
  const SourceSyncCancelledException();
}

class SourceSyncService {
  SourceSyncService(this.database, {Dio? client}) : _client = client ?? Dio();
  final AppDatabase database;
  final Dio _client;
  static const defaultCatalogUrl =
      'https://raw.githubusercontent.com/masoodmrx/TelegramProxyTester/main/config/default_sources.txt';
  CancelToken? _cancelToken;
  bool isBusy = false;

  void cancel() => _cancelToken?.cancel();

  Future<int> syncAll({
    void Function(int current, int total)? onProgress,
  }) async {
    if (isBusy) throw const SourceSyncBusyException();
    isBusy = true;
    final token = CancelToken();
    _cancelToken = token;
    try {
      var total = 0;
      final sources = await database.sourceFilesList();
      for (var index = 0; index < sources.length; index++) {
        _throwIfCancelled(token);
        total += await syncSource(sources[index], cancelToken: token);
        onProgress?.call(index + 1, sources.length);
      }
      await _cleanupAfterSync();
      return total;
    } on DioException catch (error) {
      if (CancelToken.isCancel(error)) {
        throw const SourceSyncCancelledException();
      }
      rethrow;
    } finally {
      isBusy = false;
      _cancelToken = null;
    }
  }

  Future<int> refreshDefaultSources() async {
    if (isBusy) throw const SourceSyncBusyException();
    final response = await _client.get<String>(
      defaultCatalogUrl,
      options: Options(
        responseType: ResponseType.plain,
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    final urls = (response.data ?? '')
        .split(RegExp(r'\r?\n'))
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty && !line.startsWith('#'))
        .take(100);
    var added = 0;
    for (final url in urls) {
      final uri = Uri.tryParse(url);
      if (uri?.host != 'github.com' || uri!.pathSegments.length < 2) continue;
      await database.insertSourceFile(
        url: url,
        sourceType: 'github_repository',
        validationEnabled: true,
        validationStatus: 'pending',
      );
      added++;
    }
    return added;
  }

  Future<int> syncSource(
    SourceFileRecord source, {
    CancelToken? cancelToken,
  }) async {
    try {
      _throwIfCancelled(cancelToken);
      if (source.sourceType == 'github_repository') {
        return await _syncRepository(source.url, cancelToken);
      }
      return await _syncTextFile(source.url, source.url, cancelToken);
    } on DioException catch (error) {
      if (CancelToken.isCancel(error)) rethrow;
      await database.updateSourceStatus(source.url, 'sync_failed');
      return 0;
    } on SourceSyncCancelledException {
      rethrow;
    } catch (_) {
      await database.updateSourceStatus(source.url, 'sync_failed');
      return 0;
    }
  }

  Future<int> _syncRepository(
    String repositoryUrl,
    CancelToken? cancelToken,
  ) async {
    final uri = Uri.parse(repositoryUrl);
    final segments = uri.pathSegments.where((item) => item.isNotEmpty).toList();
    if (segments.length < 2) throw StateError('Invalid GitHub repository');
    final owner = segments[0];
    final repo = segments[1].replaceFirst(RegExp(r'\.git$'), '');
    final repoResponse = await _client.get<Map<String, dynamic>>(
      'https://api.github.com/repos/$owner/$repo',
      cancelToken: cancelToken,
    );
    final branch = repoResponse.data?['default_branch'] as String? ?? 'main';
    final treeResponse = await _client.get<Map<String, dynamic>>(
      'https://api.github.com/repos/$owner/$repo/git/trees/$branch',
      queryParameters: {'recursive': '1'},
      cancelToken: cancelToken,
    );
    final entries = (treeResponse.data?['tree'] as List<dynamic>? ?? const [])
        .whereType<Map<String, dynamic>>()
        .where(
          (entry) =>
              entry['type'] == 'blob' &&
              (entry['path'] as String? ?? '').toLowerCase().endsWith('.txt'),
        )
        .take(50);
    var total = 0;
    for (final entry in entries) {
      _throwIfCancelled(cancelToken);
      final path = entry['path'] as String;
      total += await _syncTextFile(
        'https://raw.githubusercontent.com/$owner/$repo/$branch/$path',
        repositoryUrl,
        cancelToken,
      );
    }
    await database.updateSourceStatus(repositoryUrl, 'synced');
    return total;
  }

  Future<int> _syncTextFile(
    String textUrl,
    String parentUrl,
    CancelToken? cancelToken,
  ) async {
    final response = await _client.get<String>(
      textUrl,
      cancelToken: cancelToken,
      options: Options(
        responseType: ResponseType.plain,
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    final sourceId = await database.sourceIdFor(textUrl);
    final proxies = ProxyParser.parse(response.data ?? '');
    for (final proxy in proxies) {
      await database.upsertProxy(
        sourceFileId: sourceId,
        server: proxy.server,
        port: proxy.port,
        secret: proxy.secret,
        originalLink: proxy.link,
      );
    }
    await database.updateSourceStatus(parentUrl, 'synced');
    return proxies.length;
  }

  Future<void> _cleanupAfterSync() async {
    final checks =
        int.tryParse(
          database.settingsCache['proxy_checks_retention_days'] ?? '30',
        ) ??
        30;
    final proxies =
        int.tryParse(
          database.settingsCache['stale_proxy_retention_days'] ?? '14',
        ) ??
        14;
    await database.cleanupRetention(
      checkHistoryDays: checks,
      staleProxyDays: proxies,
    );
  }

  void _throwIfCancelled(CancelToken? token) {
    if (token?.isCancelled ?? false) throw const SourceSyncCancelledException();
  }
}
