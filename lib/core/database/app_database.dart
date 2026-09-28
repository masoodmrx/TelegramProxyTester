import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/proxy_models.dart';

part 'app_database.g.dart';

class SourceFiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get sourceType => text()();
  TextColumn get url => text().unique()();
  TextColumn get filePath => text().nullable()();
  TextColumn get rawUrl => text().nullable()();
  BoolColumn get validationEnabled =>
      boolean().withDefault(const Constant(true))();
  TextColumn get validationStatus => text().nullable()();
  DateTimeColumn get validatedAt => dateTime().nullable()();
  TextColumn get contentHash => text().nullable()();
  DateTimeColumn get lastScannedAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

class Proxies extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sourceFileId => integer().nullable().references(
    SourceFiles,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get server => text()();
  IntColumn get port => integer()();
  TextColumn get secret => text()();
  TextColumn get originalLink => text()();
  TextColumn get normalizedLink => text()();
  TextColumn get fingerprint => text().unique()();
  TextColumn get lastStatus => text().nullable()();
  IntColumn get lastLatencyMs => integer().nullable()();
  DateTimeColumn get lastCheckedAt => dateTime().nullable()();
  DateTimeColumn get lastSuccessAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  BoolColumn get isHidden => boolean().withDefault(const Constant(false))();
}

class ProxyChecks extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get proxyId =>
      integer().references(Proxies, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get checkedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get status => text()();
  IntColumn get latencyMs => integer().nullable()();
  TextColumn get resolvedIp => text().nullable()();
  TextColumn get errorCode => text().nullable()();
  TextColumn get errorMessage => text().nullable()();
  TextColumn get testType => text().withDefault(const Constant('tcp'))();
}

class Settings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column<Object>> get primaryKey => {key};
}

@DriftDatabase(tables: [SourceFiles, Proxies, ProxyChecks, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);
  Map<String, String> settingsCache = {};

  static Future<AppDatabase> open() async {
    final directory = await getApplicationSupportDirectory();
    final database = AppDatabase(
      LazyDatabase(
        () async => NativeDatabase(
          File('${directory.path}/telegram_proxy_tester.sqlite'),
        ),
      ),
    );
    await database.ensureOpen(_defaultSources);
    return database;
  }

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    onUpgrade: (m, from, to) async {
      if (from < 2) await _migrateLegacyTextDates(m);
      if (from < 3) await _normalizeDateValues();
      if (from < 4) {
        await customStatement(
          'ALTER TABLE proxies ADD COLUMN is_favorite INTEGER NOT NULL DEFAULT 0',
        );
        await customStatement(
          'ALTER TABLE proxies ADD COLUMN is_hidden INTEGER NOT NULL DEFAULT 0',
        );
      }
    },
  );

  Future<void> _migrateLegacyTextDates(Migrator m) async {
    // The first prototype stored DateTime values as SQLite TEXT. Drift stores
    // DateTime values as microseconds since epoch, so rebuild those tables.
    await customStatement('PRAGMA foreign_keys = OFF');
    await customStatement(
      'ALTER TABLE source_files RENAME TO source_files_legacy',
    );
    await customStatement('ALTER TABLE proxies RENAME TO proxies_legacy');
    await customStatement(
      'ALTER TABLE proxy_checks RENAME TO proxy_checks_legacy',
    );
    await m.createTable(sourceFiles);
    await m.createTable(proxies);
    await m.createTable(proxyChecks);
    await customStatement('''INSERT INTO source_files
      (id, source_type, url, file_path, raw_url, validation_enabled, validation_status,
       validated_at, content_hash, last_scanned_at, created_at, updated_at)
      SELECT id, source_type, url, file_path, raw_url, validation_enabled, validation_status,
       ${_dateExpression('validated_at')}, content_hash, ${_dateExpression('last_scanned_at')},
       ${_dateExpression('created_at')}, ${_dateExpression('updated_at')}
      FROM source_files_legacy''');
    await customStatement('''INSERT INTO proxies
      (id, source_file_id, server, port, secret, original_link, normalized_link, fingerprint,
       last_status, last_latency_ms, last_checked_at, last_success_at, created_at, updated_at)
      SELECT id, source_file_id, server, port, secret, original_link, normalized_link, fingerprint,
       last_status, last_latency_ms, ${_dateExpression('last_checked_at')},
       ${_dateExpression('last_success_at')}, ${_dateExpression('created_at')}, ${_dateExpression('updated_at')}
      FROM proxies_legacy''');
    await customStatement('''INSERT INTO proxy_checks
      (id, proxy_id, checked_at, status, latency_ms, resolved_ip, error_code, error_message, test_type)
      SELECT id, proxy_id, ${_dateExpression('checked_at')}, status, latency_ms, resolved_ip,
       error_code, error_message, test_type FROM proxy_checks_legacy''');
    await customStatement('DROP TABLE proxy_checks_legacy');
    await customStatement('DROP TABLE proxies_legacy');
    await customStatement('DROP TABLE source_files_legacy');
    await customStatement('PRAGMA foreign_keys = ON');
  }

  String _dateExpression(String column) =>
      "CASE WHEN $column IS NULL THEN NULL WHEN typeof($column) = 'integer' THEN $column ELSE CAST(strftime('%s', $column) AS INTEGER) * 1000 END";

  Future<void> _normalizeDateValues() async {
    const tables = {
      'source_files': [
        'validated_at',
        'last_scanned_at',
        'created_at',
        'updated_at',
      ],
      'proxies': [
        'last_checked_at',
        'last_success_at',
        'created_at',
        'updated_at',
      ],
      'proxy_checks': ['checked_at'],
    };
    for (final entry in tables.entries) {
      for (final column in entry.value) {
        await customStatement('''UPDATE ${entry.key}
          SET $column = CAST($column / 1000000 AS INTEGER)
          WHERE typeof($column) = 'integer' AND $column > 100000000000000''');
      }
    }
  }

  static const _defaultSources = [
    ('github_repository', 'https://github.com/SoliSpirit/mtproto'),
    (
      'github_repository',
      'https://github.com/V2RAYCONFIGSPOOL/TELEGRAM_PROXY_SUB',
    ),
    ('github_repository', 'https://github.com/zakky8/mtproto-proxy-pro'),
  ];

  Future<void> ensureOpen(List<(String, String)> defaults) async {
    await customSelect('SELECT 1').getSingle();
    await _seedDefaultSources(defaults);
    for (final entry in const {
      'language': 'unset',
      'theme': 'system',
      'app_mode': 'unset',
      'tutorial_completed': 'false',
      'proxy_checks_retention_days': '30',
      'stale_proxy_retention_days': '14',
    }.entries) {
      await into(settings).insert(
        SettingsCompanion.insert(key: entry.key, value: entry.value),
        mode: InsertMode.insertOrIgnore,
      );
    }
    final rows = await select(settings).get();
    settingsCache = {for (final row in rows) row.key: row.value};
  }

  Future<void> _seedDefaultSources(List<(String, String)> defaults) async {
    for (final source in defaults) {
      await into(sourceFiles).insert(
        SourceFilesCompanion.insert(
          sourceType: source.$1,
          url: source.$2,
          validationStatus: const Value('pending'),
        ),
        mode: InsertMode.insertOrIgnore,
      );
    }
  }

  Future<void> setSetting(String key, String value) async {
    await into(
      settings,
    ).insertOnConflictUpdate(SettingsCompanion.insert(key: key, value: value));
    settingsCache[key] = value;
  }

  Future<void> insertSourceFile({
    required String url,
    required String sourceType,
    required bool validationEnabled,
    required String validationStatus,
  }) {
    return into(sourceFiles).insertOnConflictUpdate(
      SourceFilesCompanion.insert(
        sourceType: sourceType,
        url: url,
        validationEnabled: Value(validationEnabled),
        validationStatus: Value(validationStatus),
        validatedAt: validationStatus == 'validated'
            ? Value(DateTime.now())
            : const Value.absent(),
      ),
    );
  }

  Future<int> sourceIdFor(String url) async {
    final row = await (select(
      sourceFiles,
    )..where((source) => source.url.equals(url))).getSingleOrNull();
    if (row != null) return row.id;
    await insertSourceFile(
      url: url,
      sourceType: 'txt_file',
      validationEnabled: false,
      validationStatus: 'discovered',
    );
    return (await (select(
      sourceFiles,
    )..where((source) => source.url.equals(url))).getSingle()).id;
  }

  Future<void> updateSourceStatus(String url, String status) async {
    await (update(
      sourceFiles,
    )..where((source) => source.url.equals(url))).write(
      SourceFilesCompanion(
        validationStatus: Value(status),
        lastScannedAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> upsertProxy({
    required int sourceFileId,
    required String server,
    required int port,
    required String secret,
    required String originalLink,
  }) async {
    final fingerprint = '$server:$port:$secret';
    await into(proxies).insertOnConflictUpdate(
      ProxiesCompanion.insert(
        sourceFileId: Value(sourceFileId),
        server: server,
        port: port,
        secret: secret,
        originalLink: originalLink,
        normalizedLink: originalLink,
        fingerprint: fingerprint,
      ),
    );
  }

  Future<List<ProxyCheckTarget>> allProxyTargets() async {
    final rows = await select(proxies).get();
    return [
      for (final row in rows)
        ProxyCheckTarget(id: row.id, server: row.server, port: row.port),
    ];
  }

  Future<DashboardStats> dashboardStats() async {
    final proxyCount =
        await (selectOnly(proxies)
              ..addColumns([proxies.id.count()])
              ..where(proxies.isHidden.equals(false)))
            .getSingle();
    final healthyCount =
        await (selectOnly(proxies)
              ..addColumns([proxies.id.count()])
              ..where(
                proxies.isHidden.equals(false) &
                    proxies.lastStatus.equals('reachable'),
              ))
            .getSingle();
    final sourceCount = await (selectOnly(
      sourceFiles,
    )..addColumns([sourceFiles.id.count()])).getSingle();
    final checkCount = await (selectOnly(
      proxyChecks,
    )..addColumns([proxyChecks.id.count()])).getSingle();
    return DashboardStats(
      proxies: proxyCount.read(proxies.id.count()) ?? 0,
      healthy: healthyCount.read(proxies.id.count()) ?? 0,
      sources: sourceCount.read(sourceFiles.id.count()) ?? 0,
      checks: checkCount.read(proxyChecks.id.count()) ?? 0,
    );
  }

  Future<void> saveProxyCheck({
    required int proxyId,
    required String status,
    int? latencyMs,
    String? resolvedIp,
    String? errorMessage,
  }) async {
    await into(proxyChecks).insert(
      ProxyChecksCompanion.insert(
        proxyId: proxyId,
        status: status,
        latencyMs: Value(latencyMs),
        resolvedIp: Value(resolvedIp),
        errorMessage: Value(errorMessage),
      ),
    );
    await (update(proxies)..where((proxy) => proxy.id.equals(proxyId))).write(
      ProxiesCompanion(
        lastStatus: Value(status),
        lastLatencyMs: Value(latencyMs),
        lastCheckedAt: Value(DateTime.now()),
        lastSuccessAt: status == 'reachable'
            ? Value(DateTime.now())
            : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<({int checks, int proxies})> cleanupRetention({
    required int checkHistoryDays,
    required int staleProxyDays,
  }) async {
    final checkCutoff = DateTime.now().subtract(
      Duration(days: checkHistoryDays),
    );
    final staleCutoff = DateTime.now().subtract(Duration(days: staleProxyDays));
    final oldChecks = await (delete(
      proxyChecks,
    )..where((check) => check.checkedAt.isSmallerThanValue(checkCutoff))).go();
    final oldProxies =
        await (delete(proxies)..where(
              (proxy) =>
                  proxy.lastSuccessAt.isSmallerThanValue(staleCutoff) |
                  (proxy.lastSuccessAt.isNull() &
                      proxy.lastCheckedAt.isSmallerThanValue(staleCutoff)),
            ))
            .go();
    return (checks: oldChecks, proxies: oldProxies);
  }

  Future<ProxyPage> proxiesPage({
    required int limit,
    required int offset,
    String search = '',
    bool onlyReachable = false,
    bool onlyFavorites = false,
  }) async {
    final countQuery = selectOnly(proxies)..addColumns([proxies.id.count()]);
    final query = select(proxies);
    countQuery.where(proxies.isHidden.equals(false));
    if (search.trim().isNotEmpty) {
      final value = '%${search.trim()}%';
      countQuery.where(proxies.server.like(value));
      query.where((p) => p.server.like(value));
    }
    if (onlyReachable) {
      countQuery.where(proxies.lastStatus.equals('reachable'));
      query.where((p) => p.lastStatus.equals('reachable'));
    }
    if (onlyFavorites) {
      countQuery.where(proxies.isFavorite.equals(true));
      query.where((p) => p.isFavorite.equals(true));
    }
    final count = await countQuery.getSingle();
    query
      ..where((p) => p.isHidden.equals(false))
      ..orderBy([
        (p) => OrderingTerm(expression: p.lastStatus, mode: OrderingMode.desc),
        (p) =>
            OrderingTerm(expression: p.lastLatencyMs, mode: OrderingMode.asc),
      ])
      ..limit(limit, offset: offset);
    final rows = await query.get();
    return ProxyPage([
      for (final row in rows)
        ProxyRecord(
          id: row.id,
          server: row.server,
          port: row.port,
          originalLink: row.originalLink,
          lastStatus: row.lastStatus,
          lastLatencyMs: row.lastLatencyMs,
          isFavorite: row.isFavorite,
        ),
    ], count.read(proxies.id.count()) ?? 0);
  }

  Future<void> toggleFavorite(int id, bool value) =>
      (update(proxies)..where((proxy) => proxy.id.equals(id))).write(
        ProxiesCompanion(isFavorite: Value(value)),
      );

  Future<List<SourceFileRecord>> sourceFilesList() async {
    await _seedDefaultSources(_defaultSources);
    final rows = await select(sourceFiles).get();
    return [
      for (final row in rows)
        SourceFileRecord(
          url: row.url,
          sourceType: row.sourceType,
          validationStatus: row.validationStatus,
        ),
    ];
  }
}
