import 'dart:async';
import 'dart:io';

import '../../core/database/app_database.dart';

class InternetUnavailableException implements Exception {
  const InternetUnavailableException();
}

class HealthCheckCancelledException implements Exception {
  const HealthCheckCancelledException();
}

class HealthCheckCancellationToken {
  bool isCancelled = false;
  void cancel() => isCancelled = true;
}

class InternetConnectivityService {
  const InternetConnectivityService();

  Future<void> verify() async {
    try {
      final addresses = await InternetAddress.lookup(
        'www.google.com',
      ).timeout(const Duration(seconds: 5));
      if (addresses.isEmpty) throw const InternetUnavailableException();
      final socket = await Socket.connect(
        addresses.first,
        443,
        timeout: const Duration(seconds: 5),
      );
      await socket.close();
    } catch (_) {
      throw const InternetUnavailableException();
    }
  }
}

class ProxyHealthService {
  ProxyHealthService(
    this.database, {
    this.concurrency = 8,
    this.timeout = const Duration(seconds: 5),
  });
  final AppDatabase database;
  final int concurrency;
  final Duration timeout;

  Future<int> checkAll({
    HealthCheckCancellationToken? cancellationToken,
    void Function(int current, int total)? onProgress,
  }) async {
    await const InternetConnectivityService().verify();
    final targets = await database.allProxyTargets();
    var checked = 0;
    for (var start = 0; start < targets.length; start += concurrency) {
      if (cancellationToken?.isCancelled ?? false) {
        throw const HealthCheckCancelledException();
      }
      final batch = targets.skip(start).take(concurrency);
      await Future.wait(
        batch.map((target) => _check(target, cancellationToken)),
      );
      checked += batch.length;
      onProgress?.call(checked, targets.length);
    }
    return checked;
  }

  Future<void> _check(
    dynamic target,
    HealthCheckCancellationToken? cancellationToken,
  ) async {
    if (cancellationToken?.isCancelled ?? false) return;
    final stopwatch = Stopwatch()..start();
    try {
      final addresses = await InternetAddress.lookup(
        target.server,
      ).timeout(timeout);
      final address = addresses.first;
      final socket = await Socket.connect(
        address,
        target.port,
        timeout: timeout,
      );
      await socket.close();
      stopwatch.stop();
      await database.saveProxyCheck(
        proxyId: target.id,
        status: 'reachable',
        latencyMs: stopwatch.elapsedMilliseconds,
        resolvedIp: address.address,
      );
    } catch (error) {
      stopwatch.stop();
      await database.saveProxyCheck(
        proxyId: target.id,
        status: 'unreachable',
        latencyMs: null,
        errorMessage: error.toString(),
      );
    }
  }
}
