import 'package:flutter/material.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'core/database/app_database.dart';
import 'features/app/proxy_tester_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
  final database = await AppDatabase.open();
  runApp(ProxyTesterApp(database: database));
}
