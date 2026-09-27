import 'package:dio/dio.dart';

import '../../core/database/app_database.dart';
import '../../domain/proxy_models.dart';
import 'proxy_parser.dart';

class SourceSyncService {
  SourceSyncService(this.database, {Dio? client}) : _client = client ?? Dio();
  final AppDatabase database;
  final Dio _client;

  Future<int> syncAll() async {
    var total = 0;
    for (final source in await database.sourceFilesList()) {
      total += await syncSource(source);
    }
    return total;
  }

  Future<int> syncSource(SourceFileRecord source) async {
    try {
      if (source.sourceType == 'github_repository') {
        return await _syncRepository(source.url);
      }
      return await _syncTextFile(source.url, source.url);
    } catch (_) {
      await database.updateSourceStatus(source.url, 'sync_failed');
      return 0;
    }
  }

  Future<int> _syncRepository(String repositoryUrl) async {
    final uri = Uri.parse(repositoryUrl);
    final segments = uri.pathSegments.where((item) => item.isNotEmpty).toList();
    if (segments.length < 2) throw StateError('Invalid GitHub repository');
    final owner = segments[0];
    final repo = segments[1].replaceFirst(RegExp(r'\.git$'), '');
    final repoResponse = await _client.get<Map<String, dynamic>>('https://api.github.com/repos/$owner/$repo');
    final branch = repoResponse.data?['default_branch'] as String? ?? 'main';
    final treeResponse = await _client.get<Map<String, dynamic>>('https://api.github.com/repos/$owner/$repo/git/trees/$branch', queryParameters: {'recursive': '1'});
    final entries = (treeResponse.data?['tree'] as List<dynamic>? ?? const []).whereType<Map<String, dynamic>>().where((entry) => entry['type'] == 'blob' && (entry['path'] as String? ?? '').toLowerCase().endsWith('.txt')).take(50);
    var total = 0;
    for (final entry in entries) {
      final path = entry['path'] as String;
      total += await _syncTextFile('https://raw.githubusercontent.com/$owner/$repo/$branch/$path', repositoryUrl);
    }
    await database.updateSourceStatus(repositoryUrl, 'synced');
    return total;
  }

  Future<int> _syncTextFile(String textUrl, String parentUrl) async {
    final response = await _client.get<String>(textUrl, options: Options(responseType: ResponseType.plain, receiveTimeout: const Duration(seconds: 15)));
    final sourceId = await database.sourceIdFor(textUrl);
    final proxies = ProxyParser.parse(response.data ?? '');
    for (final proxy in proxies) {
      await database.upsertProxy(sourceFileId: sourceId, server: proxy.server, port: proxy.port, secret: proxy.secret, originalLink: proxy.link);
    }
    await database.updateSourceStatus(parentUrl, 'synced');
    return proxies.length;
  }
}
