import 'dart:async';
import 'dart:io';

import '../../core/database/app_database.dart';

class ProxyHealthService {
  ProxyHealthService(this.database, {this.concurrency = 8, this.timeout = const Duration(seconds: 5)});
  final AppDatabase database;
  final int concurrency;
  final Duration timeout;

  Future<int> checkAll() async {
    final targets = await database.allProxyTargets();
    var checked = 0;
    for (var start = 0; start < targets.length; start += concurrency) {
      final batch = targets.skip(start).take(concurrency);
      await Future.wait(batch.map(_check));
      checked += batch.length;
    }
    return checked;
  }

  Future<void> _check(dynamic target) async {
    final stopwatch = Stopwatch()..start();
    try {
      final addresses = await InternetAddress.lookup(target.server).timeout(timeout);
      final address = addresses.first;
      final socket = await Socket.connect(address, target.port, timeout: timeout);
      await socket.close();
      stopwatch.stop();
      await database.saveProxyCheck(proxyId: target.id, status: 'reachable', latencyMs: stopwatch.elapsedMilliseconds, resolvedIp: address.address);
    } catch (error) {
      stopwatch.stop();
      await database.saveProxyCheck(proxyId: target.id, status: 'unreachable', latencyMs: null, errorMessage: error.toString());
    }
  }
}
