// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SourceFilesTable extends SourceFiles
    with TableInfo<$SourceFilesTable, SourceFile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourceFilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sourceTypeMeta = const VerificationMeta(
    'sourceType',
  );
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
    'source_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rawUrlMeta = const VerificationMeta('rawUrl');
  @override
  late final GeneratedColumn<String> rawUrl = GeneratedColumn<String>(
    'raw_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _validationEnabledMeta = const VerificationMeta(
    'validationEnabled',
  );
  @override
  late final GeneratedColumn<bool> validationEnabled = GeneratedColumn<bool>(
    'validation_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("validation_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _validationStatusMeta = const VerificationMeta(
    'validationStatus',
  );
  @override
  late final GeneratedColumn<String> validationStatus = GeneratedColumn<String>(
    'validation_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _validatedAtMeta = const VerificationMeta(
    'validatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> validatedAt = GeneratedColumn<DateTime>(
    'validated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentHashMeta = const VerificationMeta(
    'contentHash',
  );
  @override
  late final GeneratedColumn<String> contentHash = GeneratedColumn<String>(
    'content_hash',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastScannedAtMeta = const VerificationMeta(
    'lastScannedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastScannedAt =
      GeneratedColumn<DateTime>(
        'last_scanned_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sourceType,
    url,
    filePath,
    rawUrl,
    validationEnabled,
    validationStatus,
    validatedAt,
    contentHash,
    lastScannedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'source_files';
  @override
  VerificationContext validateIntegrity(
    Insertable<SourceFile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_type')) {
      context.handle(
        _sourceTypeMeta,
        sourceType.isAcceptableOrUnknown(data['source_type']!, _sourceTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('raw_url')) {
      context.handle(
        _rawUrlMeta,
        rawUrl.isAcceptableOrUnknown(data['raw_url']!, _rawUrlMeta),
      );
    }
    if (data.containsKey('validation_enabled')) {
      context.handle(
        _validationEnabledMeta,
        validationEnabled.isAcceptableOrUnknown(
          data['validation_enabled']!,
          _validationEnabledMeta,
        ),
      );
    }
    if (data.containsKey('validation_status')) {
      context.handle(
        _validationStatusMeta,
        validationStatus.isAcceptableOrUnknown(
          data['validation_status']!,
          _validationStatusMeta,
        ),
      );
    }
    if (data.containsKey('validated_at')) {
      context.handle(
        _validatedAtMeta,
        validatedAt.isAcceptableOrUnknown(
          data['validated_at']!,
          _validatedAtMeta,
        ),
      );
    }
    if (data.containsKey('content_hash')) {
      context.handle(
        _contentHashMeta,
        contentHash.isAcceptableOrUnknown(
          data['content_hash']!,
          _contentHashMeta,
        ),
      );
    }
    if (data.containsKey('last_scanned_at')) {
      context.handle(
        _lastScannedAtMeta,
        lastScannedAt.isAcceptableOrUnknown(
          data['last_scanned_at']!,
          _lastScannedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SourceFile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SourceFile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sourceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_type'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      rawUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_url'],
      ),
      validationEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}validation_enabled'],
      )!,
      validationStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}validation_status'],
      ),
      validatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}validated_at'],
      ),
      contentHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_hash'],
      ),
      lastScannedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_scanned_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SourceFilesTable createAlias(String alias) {
    return $SourceFilesTable(attachedDatabase, alias);
  }
}

class SourceFile extends DataClass implements Insertable<SourceFile> {
  final int id;
  final String sourceType;
  final String url;
  final String? filePath;
  final String? rawUrl;
  final bool validationEnabled;
  final String? validationStatus;
  final DateTime? validatedAt;
  final String? contentHash;
  final DateTime? lastScannedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const SourceFile({
    required this.id,
    required this.sourceType,
    required this.url,
    this.filePath,
    this.rawUrl,
    required this.validationEnabled,
    this.validationStatus,
    this.validatedAt,
    this.contentHash,
    this.lastScannedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source_type'] = Variable<String>(sourceType);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || rawUrl != null) {
      map['raw_url'] = Variable<String>(rawUrl);
    }
    map['validation_enabled'] = Variable<bool>(validationEnabled);
    if (!nullToAbsent || validationStatus != null) {
      map['validation_status'] = Variable<String>(validationStatus);
    }
    if (!nullToAbsent || validatedAt != null) {
      map['validated_at'] = Variable<DateTime>(validatedAt);
    }
    if (!nullToAbsent || contentHash != null) {
      map['content_hash'] = Variable<String>(contentHash);
    }
    if (!nullToAbsent || lastScannedAt != null) {
      map['last_scanned_at'] = Variable<DateTime>(lastScannedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SourceFilesCompanion toCompanion(bool nullToAbsent) {
    return SourceFilesCompanion(
      id: Value(id),
      sourceType: Value(sourceType),
      url: Value(url),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      rawUrl: rawUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(rawUrl),
      validationEnabled: Value(validationEnabled),
      validationStatus: validationStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(validationStatus),
      validatedAt: validatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(validatedAt),
      contentHash: contentHash == null && nullToAbsent
          ? const Value.absent()
          : Value(contentHash),
      lastScannedAt: lastScannedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastScannedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory SourceFile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SourceFile(
      id: serializer.fromJson<int>(json['id']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      url: serializer.fromJson<String>(json['url']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      rawUrl: serializer.fromJson<String?>(json['rawUrl']),
      validationEnabled: serializer.fromJson<bool>(json['validationEnabled']),
      validationStatus: serializer.fromJson<String?>(json['validationStatus']),
      validatedAt: serializer.fromJson<DateTime?>(json['validatedAt']),
      contentHash: serializer.fromJson<String?>(json['contentHash']),
      lastScannedAt: serializer.fromJson<DateTime?>(json['lastScannedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceType': serializer.toJson<String>(sourceType),
      'url': serializer.toJson<String>(url),
      'filePath': serializer.toJson<String?>(filePath),
      'rawUrl': serializer.toJson<String?>(rawUrl),
      'validationEnabled': serializer.toJson<bool>(validationEnabled),
      'validationStatus': serializer.toJson<String?>(validationStatus),
      'validatedAt': serializer.toJson<DateTime?>(validatedAt),
      'contentHash': serializer.toJson<String?>(contentHash),
      'lastScannedAt': serializer.toJson<DateTime?>(lastScannedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SourceFile copyWith({
    int? id,
    String? sourceType,
    String? url,
    Value<String?> filePath = const Value.absent(),
    Value<String?> rawUrl = const Value.absent(),
    bool? validationEnabled,
    Value<String?> validationStatus = const Value.absent(),
    Value<DateTime?> validatedAt = const Value.absent(),
    Value<String?> contentHash = const Value.absent(),
    Value<DateTime?> lastScannedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => SourceFile(
    id: id ?? this.id,
    sourceType: sourceType ?? this.sourceType,
    url: url ?? this.url,
    filePath: filePath.present ? filePath.value : this.filePath,
    rawUrl: rawUrl.present ? rawUrl.value : this.rawUrl,
    validationEnabled: validationEnabled ?? this.validationEnabled,
    validationStatus: validationStatus.present
        ? validationStatus.value
        : this.validationStatus,
    validatedAt: validatedAt.present ? validatedAt.value : this.validatedAt,
    contentHash: contentHash.present ? contentHash.value : this.contentHash,
    lastScannedAt: lastScannedAt.present
        ? lastScannedAt.value
        : this.lastScannedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SourceFile copyWithCompanion(SourceFilesCompanion data) {
    return SourceFile(
      id: data.id.present ? data.id.value : this.id,
      sourceType: data.sourceType.present
          ? data.sourceType.value
          : this.sourceType,
      url: data.url.present ? data.url.value : this.url,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      rawUrl: data.rawUrl.present ? data.rawUrl.value : this.rawUrl,
      validationEnabled: data.validationEnabled.present
          ? data.validationEnabled.value
          : this.validationEnabled,
      validationStatus: data.validationStatus.present
          ? data.validationStatus.value
          : this.validationStatus,
      validatedAt: data.validatedAt.present
          ? data.validatedAt.value
          : this.validatedAt,
      contentHash: data.contentHash.present
          ? data.contentHash.value
          : this.contentHash,
      lastScannedAt: data.lastScannedAt.present
          ? data.lastScannedAt.value
          : this.lastScannedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SourceFile(')
          ..write('id: $id, ')
          ..write('sourceType: $sourceType, ')
          ..write('url: $url, ')
          ..write('filePath: $filePath, ')
          ..write('rawUrl: $rawUrl, ')
          ..write('validationEnabled: $validationEnabled, ')
          ..write('validationStatus: $validationStatus, ')
          ..write('validatedAt: $validatedAt, ')
          ..write('contentHash: $contentHash, ')
          ..write('lastScannedAt: $lastScannedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sourceType,
    url,
    filePath,
    rawUrl,
    validationEnabled,
    validationStatus,
    validatedAt,
    contentHash,
    lastScannedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SourceFile &&
          other.id == this.id &&
          other.sourceType == this.sourceType &&
          other.url == this.url &&
          other.filePath == this.filePath &&
          other.rawUrl == this.rawUrl &&
          other.validationEnabled == this.validationEnabled &&
          other.validationStatus == this.validationStatus &&
          other.validatedAt == this.validatedAt &&
          other.contentHash == this.contentHash &&
          other.lastScannedAt == this.lastScannedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SourceFilesCompanion extends UpdateCompanion<SourceFile> {
  final Value<int> id;
  final Value<String> sourceType;
  final Value<String> url;
  final Value<String?> filePath;
  final Value<String?> rawUrl;
  final Value<bool> validationEnabled;
  final Value<String?> validationStatus;
  final Value<DateTime?> validatedAt;
  final Value<String?> contentHash;
  final Value<DateTime?> lastScannedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const SourceFilesCompanion({
    this.id = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.url = const Value.absent(),
    this.filePath = const Value.absent(),
    this.rawUrl = const Value.absent(),
    this.validationEnabled = const Value.absent(),
    this.validationStatus = const Value.absent(),
    this.validatedAt = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.lastScannedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SourceFilesCompanion.insert({
    this.id = const Value.absent(),
    required String sourceType,
    required String url,
    this.filePath = const Value.absent(),
    this.rawUrl = const Value.absent(),
    this.validationEnabled = const Value.absent(),
    this.validationStatus = const Value.absent(),
    this.validatedAt = const Value.absent(),
    this.contentHash = const Value.absent(),
    this.lastScannedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : sourceType = Value(sourceType),
       url = Value(url);
  static Insertable<SourceFile> custom({
    Expression<int>? id,
    Expression<String>? sourceType,
    Expression<String>? url,
    Expression<String>? filePath,
    Expression<String>? rawUrl,
    Expression<bool>? validationEnabled,
    Expression<String>? validationStatus,
    Expression<DateTime>? validatedAt,
    Expression<String>? contentHash,
    Expression<DateTime>? lastScannedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceType != null) 'source_type': sourceType,
      if (url != null) 'url': url,
      if (filePath != null) 'file_path': filePath,
      if (rawUrl != null) 'raw_url': rawUrl,
      if (validationEnabled != null) 'validation_enabled': validationEnabled,
      if (validationStatus != null) 'validation_status': validationStatus,
      if (validatedAt != null) 'validated_at': validatedAt,
      if (contentHash != null) 'content_hash': contentHash,
      if (lastScannedAt != null) 'last_scanned_at': lastScannedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SourceFilesCompanion copyWith({
    Value<int>? id,
    Value<String>? sourceType,
    Value<String>? url,
    Value<String?>? filePath,
    Value<String?>? rawUrl,
    Value<bool>? validationEnabled,
    Value<String?>? validationStatus,
    Value<DateTime?>? validatedAt,
    Value<String?>? contentHash,
    Value<DateTime?>? lastScannedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return SourceFilesCompanion(
      id: id ?? this.id,
      sourceType: sourceType ?? this.sourceType,
      url: url ?? this.url,
      filePath: filePath ?? this.filePath,
      rawUrl: rawUrl ?? this.rawUrl,
      validationEnabled: validationEnabled ?? this.validationEnabled,
      validationStatus: validationStatus ?? this.validationStatus,
      validatedAt: validatedAt ?? this.validatedAt,
      contentHash: contentHash ?? this.contentHash,
      lastScannedAt: lastScannedAt ?? this.lastScannedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (rawUrl.present) {
      map['raw_url'] = Variable<String>(rawUrl.value);
    }
    if (validationEnabled.present) {
      map['validation_enabled'] = Variable<bool>(validationEnabled.value);
    }
    if (validationStatus.present) {
      map['validation_status'] = Variable<String>(validationStatus.value);
    }
    if (validatedAt.present) {
      map['validated_at'] = Variable<DateTime>(validatedAt.value);
    }
    if (contentHash.present) {
      map['content_hash'] = Variable<String>(contentHash.value);
    }
    if (lastScannedAt.present) {
      map['last_scanned_at'] = Variable<DateTime>(lastScannedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourceFilesCompanion(')
          ..write('id: $id, ')
          ..write('sourceType: $sourceType, ')
          ..write('url: $url, ')
          ..write('filePath: $filePath, ')
          ..write('rawUrl: $rawUrl, ')
          ..write('validationEnabled: $validationEnabled, ')
          ..write('validationStatus: $validationStatus, ')
          ..write('validatedAt: $validatedAt, ')
          ..write('contentHash: $contentHash, ')
          ..write('lastScannedAt: $lastScannedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProxiesTable extends Proxies with TableInfo<$ProxiesTable, Proxy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProxiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sourceFileIdMeta = const VerificationMeta(
    'sourceFileId',
  );
  @override
  late final GeneratedColumn<int> sourceFileId = GeneratedColumn<int>(
    'source_file_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES source_files (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _serverMeta = const VerificationMeta('server');
  @override
  late final GeneratedColumn<String> server = GeneratedColumn<String>(
    'server',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _portMeta = const VerificationMeta('port');
  @override
  late final GeneratedColumn<int> port = GeneratedColumn<int>(
    'port',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _secretMeta = const VerificationMeta('secret');
  @override
  late final GeneratedColumn<String> secret = GeneratedColumn<String>(
    'secret',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _originalLinkMeta = const VerificationMeta(
    'originalLink',
  );
  @override
  late final GeneratedColumn<String> originalLink = GeneratedColumn<String>(
    'original_link',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _normalizedLinkMeta = const VerificationMeta(
    'normalizedLink',
  );
  @override
  late final GeneratedColumn<String> normalizedLink = GeneratedColumn<String>(
    'normalized_link',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fingerprintMeta = const VerificationMeta(
    'fingerprint',
  );
  @override
  late final GeneratedColumn<String> fingerprint = GeneratedColumn<String>(
    'fingerprint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _lastStatusMeta = const VerificationMeta(
    'lastStatus',
  );
  @override
  late final GeneratedColumn<String> lastStatus = GeneratedColumn<String>(
    'last_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastLatencyMsMeta = const VerificationMeta(
    'lastLatencyMs',
  );
  @override
  late final GeneratedColumn<int> lastLatencyMs = GeneratedColumn<int>(
    'last_latency_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastCheckedAtMeta = const VerificationMeta(
    'lastCheckedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastCheckedAt =
      GeneratedColumn<DateTime>(
        'last_checked_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _lastSuccessAtMeta = const VerificationMeta(
    'lastSuccessAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSuccessAt =
      GeneratedColumn<DateTime>(
        'last_success_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isFavoriteMeta = const VerificationMeta(
    'isFavorite',
  );
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
    'is_favorite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_favorite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isHiddenMeta = const VerificationMeta(
    'isHidden',
  );
  @override
  late final GeneratedColumn<bool> isHidden = GeneratedColumn<bool>(
    'is_hidden',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_hidden" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sourceFileId,
    server,
    port,
    secret,
    originalLink,
    normalizedLink,
    fingerprint,
    lastStatus,
    lastLatencyMs,
    lastCheckedAt,
    lastSuccessAt,
    createdAt,
    updatedAt,
    isFavorite,
    isHidden,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'proxies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Proxy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source_file_id')) {
      context.handle(
        _sourceFileIdMeta,
        sourceFileId.isAcceptableOrUnknown(
          data['source_file_id']!,
          _sourceFileIdMeta,
        ),
      );
    }
    if (data.containsKey('server')) {
      context.handle(
        _serverMeta,
        server.isAcceptableOrUnknown(data['server']!, _serverMeta),
      );
    } else if (isInserting) {
      context.missing(_serverMeta);
    }
    if (data.containsKey('port')) {
      context.handle(
        _portMeta,
        port.isAcceptableOrUnknown(data['port']!, _portMeta),
      );
    } else if (isInserting) {
      context.missing(_portMeta);
    }
    if (data.containsKey('secret')) {
      context.handle(
        _secretMeta,
        secret.isAcceptableOrUnknown(data['secret']!, _secretMeta),
      );
    } else if (isInserting) {
      context.missing(_secretMeta);
    }
    if (data.containsKey('original_link')) {
      context.handle(
        _originalLinkMeta,
        originalLink.isAcceptableOrUnknown(
          data['original_link']!,
          _originalLinkMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_originalLinkMeta);
    }
    if (data.containsKey('normalized_link')) {
      context.handle(
        _normalizedLinkMeta,
        normalizedLink.isAcceptableOrUnknown(
          data['normalized_link']!,
          _normalizedLinkMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_normalizedLinkMeta);
    }
    if (data.containsKey('fingerprint')) {
      context.handle(
        _fingerprintMeta,
        fingerprint.isAcceptableOrUnknown(
          data['fingerprint']!,
          _fingerprintMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fingerprintMeta);
    }
    if (data.containsKey('last_status')) {
      context.handle(
        _lastStatusMeta,
        lastStatus.isAcceptableOrUnknown(data['last_status']!, _lastStatusMeta),
      );
    }
    if (data.containsKey('last_latency_ms')) {
      context.handle(
        _lastLatencyMsMeta,
        lastLatencyMs.isAcceptableOrUnknown(
          data['last_latency_ms']!,
          _lastLatencyMsMeta,
        ),
      );
    }
    if (data.containsKey('last_checked_at')) {
      context.handle(
        _lastCheckedAtMeta,
        lastCheckedAt.isAcceptableOrUnknown(
          data['last_checked_at']!,
          _lastCheckedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_success_at')) {
      context.handle(
        _lastSuccessAtMeta,
        lastSuccessAt.isAcceptableOrUnknown(
          data['last_success_at']!,
          _lastSuccessAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
        _isFavoriteMeta,
        isFavorite.isAcceptableOrUnknown(data['is_favorite']!, _isFavoriteMeta),
      );
    }
    if (data.containsKey('is_hidden')) {
      context.handle(
        _isHiddenMeta,
        isHidden.isAcceptableOrUnknown(data['is_hidden']!, _isHiddenMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Proxy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Proxy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sourceFileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_file_id'],
      ),
      server: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server'],
      )!,
      port: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}port'],
      )!,
      secret: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secret'],
      )!,
      originalLink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}original_link'],
      )!,
      normalizedLink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}normalized_link'],
      )!,
      fingerprint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fingerprint'],
      )!,
      lastStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_status'],
      ),
      lastLatencyMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_latency_ms'],
      ),
      lastCheckedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_checked_at'],
      ),
      lastSuccessAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_success_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isFavorite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_favorite'],
      )!,
      isHidden: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_hidden'],
      )!,
    );
  }

  @override
  $ProxiesTable createAlias(String alias) {
    return $ProxiesTable(attachedDatabase, alias);
  }
}

class Proxy extends DataClass implements Insertable<Proxy> {
  final int id;
  final int? sourceFileId;
  final String server;
  final int port;
  final String secret;
  final String originalLink;
  final String normalizedLink;
  final String fingerprint;
  final String? lastStatus;
  final int? lastLatencyMs;
  final DateTime? lastCheckedAt;
  final DateTime? lastSuccessAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isFavorite;
  final bool isHidden;
  const Proxy({
    required this.id,
    this.sourceFileId,
    required this.server,
    required this.port,
    required this.secret,
    required this.originalLink,
    required this.normalizedLink,
    required this.fingerprint,
    this.lastStatus,
    this.lastLatencyMs,
    this.lastCheckedAt,
    this.lastSuccessAt,
    required this.createdAt,
    required this.updatedAt,
    required this.isFavorite,
    required this.isHidden,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || sourceFileId != null) {
      map['source_file_id'] = Variable<int>(sourceFileId);
    }
    map['server'] = Variable<String>(server);
    map['port'] = Variable<int>(port);
    map['secret'] = Variable<String>(secret);
    map['original_link'] = Variable<String>(originalLink);
    map['normalized_link'] = Variable<String>(normalizedLink);
    map['fingerprint'] = Variable<String>(fingerprint);
    if (!nullToAbsent || lastStatus != null) {
      map['last_status'] = Variable<String>(lastStatus);
    }
    if (!nullToAbsent || lastLatencyMs != null) {
      map['last_latency_ms'] = Variable<int>(lastLatencyMs);
    }
    if (!nullToAbsent || lastCheckedAt != null) {
      map['last_checked_at'] = Variable<DateTime>(lastCheckedAt);
    }
    if (!nullToAbsent || lastSuccessAt != null) {
      map['last_success_at'] = Variable<DateTime>(lastSuccessAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['is_hidden'] = Variable<bool>(isHidden);
    return map;
  }

  ProxiesCompanion toCompanion(bool nullToAbsent) {
    return ProxiesCompanion(
      id: Value(id),
      sourceFileId: sourceFileId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceFileId),
      server: Value(server),
      port: Value(port),
      secret: Value(secret),
      originalLink: Value(originalLink),
      normalizedLink: Value(normalizedLink),
      fingerprint: Value(fingerprint),
      lastStatus: lastStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(lastStatus),
      lastLatencyMs: lastLatencyMs == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLatencyMs),
      lastCheckedAt: lastCheckedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCheckedAt),
      lastSuccessAt: lastSuccessAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSuccessAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isFavorite: Value(isFavorite),
      isHidden: Value(isHidden),
    );
  }

  factory Proxy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Proxy(
      id: serializer.fromJson<int>(json['id']),
      sourceFileId: serializer.fromJson<int?>(json['sourceFileId']),
      server: serializer.fromJson<String>(json['server']),
      port: serializer.fromJson<int>(json['port']),
      secret: serializer.fromJson<String>(json['secret']),
      originalLink: serializer.fromJson<String>(json['originalLink']),
      normalizedLink: serializer.fromJson<String>(json['normalizedLink']),
      fingerprint: serializer.fromJson<String>(json['fingerprint']),
      lastStatus: serializer.fromJson<String?>(json['lastStatus']),
      lastLatencyMs: serializer.fromJson<int?>(json['lastLatencyMs']),
      lastCheckedAt: serializer.fromJson<DateTime?>(json['lastCheckedAt']),
      lastSuccessAt: serializer.fromJson<DateTime?>(json['lastSuccessAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      isHidden: serializer.fromJson<bool>(json['isHidden']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sourceFileId': serializer.toJson<int?>(sourceFileId),
      'server': serializer.toJson<String>(server),
      'port': serializer.toJson<int>(port),
      'secret': serializer.toJson<String>(secret),
      'originalLink': serializer.toJson<String>(originalLink),
      'normalizedLink': serializer.toJson<String>(normalizedLink),
      'fingerprint': serializer.toJson<String>(fingerprint),
      'lastStatus': serializer.toJson<String?>(lastStatus),
      'lastLatencyMs': serializer.toJson<int?>(lastLatencyMs),
      'lastCheckedAt': serializer.toJson<DateTime?>(lastCheckedAt),
      'lastSuccessAt': serializer.toJson<DateTime?>(lastSuccessAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'isHidden': serializer.toJson<bool>(isHidden),
    };
  }

  Proxy copyWith({
    int? id,
    Value<int?> sourceFileId = const Value.absent(),
    String? server,
    int? port,
    String? secret,
    String? originalLink,
    String? normalizedLink,
    String? fingerprint,
    Value<String?> lastStatus = const Value.absent(),
    Value<int?> lastLatencyMs = const Value.absent(),
    Value<DateTime?> lastCheckedAt = const Value.absent(),
    Value<DateTime?> lastSuccessAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isFavorite,
    bool? isHidden,
  }) => Proxy(
    id: id ?? this.id,
    sourceFileId: sourceFileId.present ? sourceFileId.value : this.sourceFileId,
    server: server ?? this.server,
    port: port ?? this.port,
    secret: secret ?? this.secret,
    originalLink: originalLink ?? this.originalLink,
    normalizedLink: normalizedLink ?? this.normalizedLink,
    fingerprint: fingerprint ?? this.fingerprint,
    lastStatus: lastStatus.present ? lastStatus.value : this.lastStatus,
    lastLatencyMs: lastLatencyMs.present
        ? lastLatencyMs.value
        : this.lastLatencyMs,
    lastCheckedAt: lastCheckedAt.present
        ? lastCheckedAt.value
        : this.lastCheckedAt,
    lastSuccessAt: lastSuccessAt.present
        ? lastSuccessAt.value
        : this.lastSuccessAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    isFavorite: isFavorite ?? this.isFavorite,
    isHidden: isHidden ?? this.isHidden,
  );
  Proxy copyWithCompanion(ProxiesCompanion data) {
    return Proxy(
      id: data.id.present ? data.id.value : this.id,
      sourceFileId: data.sourceFileId.present
          ? data.sourceFileId.value
          : this.sourceFileId,
      server: data.server.present ? data.server.value : this.server,
      port: data.port.present ? data.port.value : this.port,
      secret: data.secret.present ? data.secret.value : this.secret,
      originalLink: data.originalLink.present
          ? data.originalLink.value
          : this.originalLink,
      normalizedLink: data.normalizedLink.present
          ? data.normalizedLink.value
          : this.normalizedLink,
      fingerprint: data.fingerprint.present
          ? data.fingerprint.value
          : this.fingerprint,
      lastStatus: data.lastStatus.present
          ? data.lastStatus.value
          : this.lastStatus,
      lastLatencyMs: data.lastLatencyMs.present
          ? data.lastLatencyMs.value
          : this.lastLatencyMs,
      lastCheckedAt: data.lastCheckedAt.present
          ? data.lastCheckedAt.value
          : this.lastCheckedAt,
      lastSuccessAt: data.lastSuccessAt.present
          ? data.lastSuccessAt.value
          : this.lastSuccessAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isFavorite: data.isFavorite.present
          ? data.isFavorite.value
          : this.isFavorite,
      isHidden: data.isHidden.present ? data.isHidden.value : this.isHidden,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Proxy(')
          ..write('id: $id, ')
          ..write('sourceFileId: $sourceFileId, ')
          ..write('server: $server, ')
          ..write('port: $port, ')
          ..write('secret: $secret, ')
          ..write('originalLink: $originalLink, ')
          ..write('normalizedLink: $normalizedLink, ')
          ..write('fingerprint: $fingerprint, ')
          ..write('lastStatus: $lastStatus, ')
          ..write('lastLatencyMs: $lastLatencyMs, ')
          ..write('lastCheckedAt: $lastCheckedAt, ')
          ..write('lastSuccessAt: $lastSuccessAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isHidden: $isHidden')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sourceFileId,
    server,
    port,
    secret,
    originalLink,
    normalizedLink,
    fingerprint,
    lastStatus,
    lastLatencyMs,
    lastCheckedAt,
    lastSuccessAt,
    createdAt,
    updatedAt,
    isFavorite,
    isHidden,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Proxy &&
          other.id == this.id &&
          other.sourceFileId == this.sourceFileId &&
          other.server == this.server &&
          other.port == this.port &&
          other.secret == this.secret &&
          other.originalLink == this.originalLink &&
          other.normalizedLink == this.normalizedLink &&
          other.fingerprint == this.fingerprint &&
          other.lastStatus == this.lastStatus &&
          other.lastLatencyMs == this.lastLatencyMs &&
          other.lastCheckedAt == this.lastCheckedAt &&
          other.lastSuccessAt == this.lastSuccessAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isFavorite == this.isFavorite &&
          other.isHidden == this.isHidden);
}

class ProxiesCompanion extends UpdateCompanion<Proxy> {
  final Value<int> id;
  final Value<int?> sourceFileId;
  final Value<String> server;
  final Value<int> port;
  final Value<String> secret;
  final Value<String> originalLink;
  final Value<String> normalizedLink;
  final Value<String> fingerprint;
  final Value<String?> lastStatus;
  final Value<int?> lastLatencyMs;
  final Value<DateTime?> lastCheckedAt;
  final Value<DateTime?> lastSuccessAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> isFavorite;
  final Value<bool> isHidden;
  const ProxiesCompanion({
    this.id = const Value.absent(),
    this.sourceFileId = const Value.absent(),
    this.server = const Value.absent(),
    this.port = const Value.absent(),
    this.secret = const Value.absent(),
    this.originalLink = const Value.absent(),
    this.normalizedLink = const Value.absent(),
    this.fingerprint = const Value.absent(),
    this.lastStatus = const Value.absent(),
    this.lastLatencyMs = const Value.absent(),
    this.lastCheckedAt = const Value.absent(),
    this.lastSuccessAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isHidden = const Value.absent(),
  });
  ProxiesCompanion.insert({
    this.id = const Value.absent(),
    this.sourceFileId = const Value.absent(),
    required String server,
    required int port,
    required String secret,
    required String originalLink,
    required String normalizedLink,
    required String fingerprint,
    this.lastStatus = const Value.absent(),
    this.lastLatencyMs = const Value.absent(),
    this.lastCheckedAt = const Value.absent(),
    this.lastSuccessAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isHidden = const Value.absent(),
  }) : server = Value(server),
       port = Value(port),
       secret = Value(secret),
       originalLink = Value(originalLink),
       normalizedLink = Value(normalizedLink),
       fingerprint = Value(fingerprint);
  static Insertable<Proxy> custom({
    Expression<int>? id,
    Expression<int>? sourceFileId,
    Expression<String>? server,
    Expression<int>? port,
    Expression<String>? secret,
    Expression<String>? originalLink,
    Expression<String>? normalizedLink,
    Expression<String>? fingerprint,
    Expression<String>? lastStatus,
    Expression<int>? lastLatencyMs,
    Expression<DateTime>? lastCheckedAt,
    Expression<DateTime>? lastSuccessAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isFavorite,
    Expression<bool>? isHidden,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceFileId != null) 'source_file_id': sourceFileId,
      if (server != null) 'server': server,
      if (port != null) 'port': port,
      if (secret != null) 'secret': secret,
      if (originalLink != null) 'original_link': originalLink,
      if (normalizedLink != null) 'normalized_link': normalizedLink,
      if (fingerprint != null) 'fingerprint': fingerprint,
      if (lastStatus != null) 'last_status': lastStatus,
      if (lastLatencyMs != null) 'last_latency_ms': lastLatencyMs,
      if (lastCheckedAt != null) 'last_checked_at': lastCheckedAt,
      if (lastSuccessAt != null) 'last_success_at': lastSuccessAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isHidden != null) 'is_hidden': isHidden,
    });
  }

  ProxiesCompanion copyWith({
    Value<int>? id,
    Value<int?>? sourceFileId,
    Value<String>? server,
    Value<int>? port,
    Value<String>? secret,
    Value<String>? originalLink,
    Value<String>? normalizedLink,
    Value<String>? fingerprint,
    Value<String?>? lastStatus,
    Value<int?>? lastLatencyMs,
    Value<DateTime?>? lastCheckedAt,
    Value<DateTime?>? lastSuccessAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<bool>? isFavorite,
    Value<bool>? isHidden,
  }) {
    return ProxiesCompanion(
      id: id ?? this.id,
      sourceFileId: sourceFileId ?? this.sourceFileId,
      server: server ?? this.server,
      port: port ?? this.port,
      secret: secret ?? this.secret,
      originalLink: originalLink ?? this.originalLink,
      normalizedLink: normalizedLink ?? this.normalizedLink,
      fingerprint: fingerprint ?? this.fingerprint,
      lastStatus: lastStatus ?? this.lastStatus,
      lastLatencyMs: lastLatencyMs ?? this.lastLatencyMs,
      lastCheckedAt: lastCheckedAt ?? this.lastCheckedAt,
      lastSuccessAt: lastSuccessAt ?? this.lastSuccessAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavorite: isFavorite ?? this.isFavorite,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sourceFileId.present) {
      map['source_file_id'] = Variable<int>(sourceFileId.value);
    }
    if (server.present) {
      map['server'] = Variable<String>(server.value);
    }
    if (port.present) {
      map['port'] = Variable<int>(port.value);
    }
    if (secret.present) {
      map['secret'] = Variable<String>(secret.value);
    }
    if (originalLink.present) {
      map['original_link'] = Variable<String>(originalLink.value);
    }
    if (normalizedLink.present) {
      map['normalized_link'] = Variable<String>(normalizedLink.value);
    }
    if (fingerprint.present) {
      map['fingerprint'] = Variable<String>(fingerprint.value);
    }
    if (lastStatus.present) {
      map['last_status'] = Variable<String>(lastStatus.value);
    }
    if (lastLatencyMs.present) {
      map['last_latency_ms'] = Variable<int>(lastLatencyMs.value);
    }
    if (lastCheckedAt.present) {
      map['last_checked_at'] = Variable<DateTime>(lastCheckedAt.value);
    }
    if (lastSuccessAt.present) {
      map['last_success_at'] = Variable<DateTime>(lastSuccessAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (isHidden.present) {
      map['is_hidden'] = Variable<bool>(isHidden.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProxiesCompanion(')
          ..write('id: $id, ')
          ..write('sourceFileId: $sourceFileId, ')
          ..write('server: $server, ')
          ..write('port: $port, ')
          ..write('secret: $secret, ')
          ..write('originalLink: $originalLink, ')
          ..write('normalizedLink: $normalizedLink, ')
          ..write('fingerprint: $fingerprint, ')
          ..write('lastStatus: $lastStatus, ')
          ..write('lastLatencyMs: $lastLatencyMs, ')
          ..write('lastCheckedAt: $lastCheckedAt, ')
          ..write('lastSuccessAt: $lastSuccessAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isHidden: $isHidden')
          ..write(')'))
        .toString();
  }
}

class $ProxyChecksTable extends ProxyChecks
    with TableInfo<$ProxyChecksTable, ProxyCheck> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProxyChecksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _proxyIdMeta = const VerificationMeta(
    'proxyId',
  );
  @override
  late final GeneratedColumn<int> proxyId = GeneratedColumn<int>(
    'proxy_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES proxies (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _checkedAtMeta = const VerificationMeta(
    'checkedAt',
  );
  @override
  late final GeneratedColumn<DateTime> checkedAt = GeneratedColumn<DateTime>(
    'checked_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latencyMsMeta = const VerificationMeta(
    'latencyMs',
  );
  @override
  late final GeneratedColumn<int> latencyMs = GeneratedColumn<int>(
    'latency_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resolvedIpMeta = const VerificationMeta(
    'resolvedIp',
  );
  @override
  late final GeneratedColumn<String> resolvedIp = GeneratedColumn<String>(
    'resolved_ip',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorCodeMeta = const VerificationMeta(
    'errorCode',
  );
  @override
  late final GeneratedColumn<String> errorCode = GeneratedColumn<String>(
    'error_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _testTypeMeta = const VerificationMeta(
    'testType',
  );
  @override
  late final GeneratedColumn<String> testType = GeneratedColumn<String>(
    'test_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('tcp'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    proxyId,
    checkedAt,
    status,
    latencyMs,
    resolvedIp,
    errorCode,
    errorMessage,
    testType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'proxy_checks';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProxyCheck> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('proxy_id')) {
      context.handle(
        _proxyIdMeta,
        proxyId.isAcceptableOrUnknown(data['proxy_id']!, _proxyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_proxyIdMeta);
    }
    if (data.containsKey('checked_at')) {
      context.handle(
        _checkedAtMeta,
        checkedAt.isAcceptableOrUnknown(data['checked_at']!, _checkedAtMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('latency_ms')) {
      context.handle(
        _latencyMsMeta,
        latencyMs.isAcceptableOrUnknown(data['latency_ms']!, _latencyMsMeta),
      );
    }
    if (data.containsKey('resolved_ip')) {
      context.handle(
        _resolvedIpMeta,
        resolvedIp.isAcceptableOrUnknown(data['resolved_ip']!, _resolvedIpMeta),
      );
    }
    if (data.containsKey('error_code')) {
      context.handle(
        _errorCodeMeta,
        errorCode.isAcceptableOrUnknown(data['error_code']!, _errorCodeMeta),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    if (data.containsKey('test_type')) {
      context.handle(
        _testTypeMeta,
        testType.isAcceptableOrUnknown(data['test_type']!, _testTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProxyCheck map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProxyCheck(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      proxyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}proxy_id'],
      )!,
      checkedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}checked_at'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      latencyMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}latency_ms'],
      ),
      resolvedIp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resolved_ip'],
      ),
      errorCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_code'],
      ),
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      testType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_type'],
      )!,
    );
  }

  @override
  $ProxyChecksTable createAlias(String alias) {
    return $ProxyChecksTable(attachedDatabase, alias);
  }
}

class ProxyCheck extends DataClass implements Insertable<ProxyCheck> {
  final int id;
  final int proxyId;
  final DateTime checkedAt;
  final String status;
  final int? latencyMs;
  final String? resolvedIp;
  final String? errorCode;
  final String? errorMessage;
  final String testType;
  const ProxyCheck({
    required this.id,
    required this.proxyId,
    required this.checkedAt,
    required this.status,
    this.latencyMs,
    this.resolvedIp,
    this.errorCode,
    this.errorMessage,
    required this.testType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proxy_id'] = Variable<int>(proxyId);
    map['checked_at'] = Variable<DateTime>(checkedAt);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || latencyMs != null) {
      map['latency_ms'] = Variable<int>(latencyMs);
    }
    if (!nullToAbsent || resolvedIp != null) {
      map['resolved_ip'] = Variable<String>(resolvedIp);
    }
    if (!nullToAbsent || errorCode != null) {
      map['error_code'] = Variable<String>(errorCode);
    }
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['test_type'] = Variable<String>(testType);
    return map;
  }

  ProxyChecksCompanion toCompanion(bool nullToAbsent) {
    return ProxyChecksCompanion(
      id: Value(id),
      proxyId: Value(proxyId),
      checkedAt: Value(checkedAt),
      status: Value(status),
      latencyMs: latencyMs == null && nullToAbsent
          ? const Value.absent()
          : Value(latencyMs),
      resolvedIp: resolvedIp == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedIp),
      errorCode: errorCode == null && nullToAbsent
          ? const Value.absent()
          : Value(errorCode),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      testType: Value(testType),
    );
  }

  factory ProxyCheck.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProxyCheck(
      id: serializer.fromJson<int>(json['id']),
      proxyId: serializer.fromJson<int>(json['proxyId']),
      checkedAt: serializer.fromJson<DateTime>(json['checkedAt']),
      status: serializer.fromJson<String>(json['status']),
      latencyMs: serializer.fromJson<int?>(json['latencyMs']),
      resolvedIp: serializer.fromJson<String?>(json['resolvedIp']),
      errorCode: serializer.fromJson<String?>(json['errorCode']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      testType: serializer.fromJson<String>(json['testType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proxyId': serializer.toJson<int>(proxyId),
      'checkedAt': serializer.toJson<DateTime>(checkedAt),
      'status': serializer.toJson<String>(status),
      'latencyMs': serializer.toJson<int?>(latencyMs),
      'resolvedIp': serializer.toJson<String?>(resolvedIp),
      'errorCode': serializer.toJson<String?>(errorCode),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'testType': serializer.toJson<String>(testType),
    };
  }

  ProxyCheck copyWith({
    int? id,
    int? proxyId,
    DateTime? checkedAt,
    String? status,
    Value<int?> latencyMs = const Value.absent(),
    Value<String?> resolvedIp = const Value.absent(),
    Value<String?> errorCode = const Value.absent(),
    Value<String?> errorMessage = const Value.absent(),
    String? testType,
  }) => ProxyCheck(
    id: id ?? this.id,
    proxyId: proxyId ?? this.proxyId,
    checkedAt: checkedAt ?? this.checkedAt,
    status: status ?? this.status,
    latencyMs: latencyMs.present ? latencyMs.value : this.latencyMs,
    resolvedIp: resolvedIp.present ? resolvedIp.value : this.resolvedIp,
    errorCode: errorCode.present ? errorCode.value : this.errorCode,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    testType: testType ?? this.testType,
  );
  ProxyCheck copyWithCompanion(ProxyChecksCompanion data) {
    return ProxyCheck(
      id: data.id.present ? data.id.value : this.id,
      proxyId: data.proxyId.present ? data.proxyId.value : this.proxyId,
      checkedAt: data.checkedAt.present ? data.checkedAt.value : this.checkedAt,
      status: data.status.present ? data.status.value : this.status,
      latencyMs: data.latencyMs.present ? data.latencyMs.value : this.latencyMs,
      resolvedIp: data.resolvedIp.present
          ? data.resolvedIp.value
          : this.resolvedIp,
      errorCode: data.errorCode.present ? data.errorCode.value : this.errorCode,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      testType: data.testType.present ? data.testType.value : this.testType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProxyCheck(')
          ..write('id: $id, ')
          ..write('proxyId: $proxyId, ')
          ..write('checkedAt: $checkedAt, ')
          ..write('status: $status, ')
          ..write('latencyMs: $latencyMs, ')
          ..write('resolvedIp: $resolvedIp, ')
          ..write('errorCode: $errorCode, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('testType: $testType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    proxyId,
    checkedAt,
    status,
    latencyMs,
    resolvedIp,
    errorCode,
    errorMessage,
    testType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProxyCheck &&
          other.id == this.id &&
          other.proxyId == this.proxyId &&
          other.checkedAt == this.checkedAt &&
          other.status == this.status &&
          other.latencyMs == this.latencyMs &&
          other.resolvedIp == this.resolvedIp &&
          other.errorCode == this.errorCode &&
          other.errorMessage == this.errorMessage &&
          other.testType == this.testType);
}

class ProxyChecksCompanion extends UpdateCompanion<ProxyCheck> {
  final Value<int> id;
  final Value<int> proxyId;
  final Value<DateTime> checkedAt;
  final Value<String> status;
  final Value<int?> latencyMs;
  final Value<String?> resolvedIp;
  final Value<String?> errorCode;
  final Value<String?> errorMessage;
  final Value<String> testType;
  const ProxyChecksCompanion({
    this.id = const Value.absent(),
    this.proxyId = const Value.absent(),
    this.checkedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.latencyMs = const Value.absent(),
    this.resolvedIp = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.testType = const Value.absent(),
  });
  ProxyChecksCompanion.insert({
    this.id = const Value.absent(),
    required int proxyId,
    this.checkedAt = const Value.absent(),
    required String status,
    this.latencyMs = const Value.absent(),
    this.resolvedIp = const Value.absent(),
    this.errorCode = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.testType = const Value.absent(),
  }) : proxyId = Value(proxyId),
       status = Value(status);
  static Insertable<ProxyCheck> custom({
    Expression<int>? id,
    Expression<int>? proxyId,
    Expression<DateTime>? checkedAt,
    Expression<String>? status,
    Expression<int>? latencyMs,
    Expression<String>? resolvedIp,
    Expression<String>? errorCode,
    Expression<String>? errorMessage,
    Expression<String>? testType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proxyId != null) 'proxy_id': proxyId,
      if (checkedAt != null) 'checked_at': checkedAt,
      if (status != null) 'status': status,
      if (latencyMs != null) 'latency_ms': latencyMs,
      if (resolvedIp != null) 'resolved_ip': resolvedIp,
      if (errorCode != null) 'error_code': errorCode,
      if (errorMessage != null) 'error_message': errorMessage,
      if (testType != null) 'test_type': testType,
    });
  }

  ProxyChecksCompanion copyWith({
    Value<int>? id,
    Value<int>? proxyId,
    Value<DateTime>? checkedAt,
    Value<String>? status,
    Value<int?>? latencyMs,
    Value<String?>? resolvedIp,
    Value<String?>? errorCode,
    Value<String?>? errorMessage,
    Value<String>? testType,
  }) {
    return ProxyChecksCompanion(
      id: id ?? this.id,
      proxyId: proxyId ?? this.proxyId,
      checkedAt: checkedAt ?? this.checkedAt,
      status: status ?? this.status,
      latencyMs: latencyMs ?? this.latencyMs,
      resolvedIp: resolvedIp ?? this.resolvedIp,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      testType: testType ?? this.testType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (proxyId.present) {
      map['proxy_id'] = Variable<int>(proxyId.value);
    }
    if (checkedAt.present) {
      map['checked_at'] = Variable<DateTime>(checkedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (latencyMs.present) {
      map['latency_ms'] = Variable<int>(latencyMs.value);
    }
    if (resolvedIp.present) {
      map['resolved_ip'] = Variable<String>(resolvedIp.value);
    }
    if (errorCode.present) {
      map['error_code'] = Variable<String>(errorCode.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (testType.present) {
      map['test_type'] = Variable<String>(testType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProxyChecksCompanion(')
          ..write('id: $id, ')
          ..write('proxyId: $proxyId, ')
          ..write('checkedAt: $checkedAt, ')
          ..write('status: $status, ')
          ..write('latencyMs: $latencyMs, ')
          ..write('resolvedIp: $resolvedIp, ')
          ..write('errorCode: $errorCode, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('testType: $testType')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final String key;
  final String value;
  const Setting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(key: Value(key), value: Value(value));
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  Setting copyWith({String? key, String? value}) =>
      Setting(key: key ?? this.key, value: value ?? this.value);
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting && other.key == this.key && other.value == this.value);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<Setting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SourceFilesTable sourceFiles = $SourceFilesTable(this);
  late final $ProxiesTable proxies = $ProxiesTable(this);
  late final $ProxyChecksTable proxyChecks = $ProxyChecksTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sourceFiles,
    proxies,
    proxyChecks,
    settings,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'source_files',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('proxies', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'proxies',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('proxy_checks', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$SourceFilesTableCreateCompanionBuilder =
    SourceFilesCompanion Function({
      Value<int> id,
      required String sourceType,
      required String url,
      Value<String?> filePath,
      Value<String?> rawUrl,
      Value<bool> validationEnabled,
      Value<String?> validationStatus,
      Value<DateTime?> validatedAt,
      Value<String?> contentHash,
      Value<DateTime?> lastScannedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$SourceFilesTableUpdateCompanionBuilder =
    SourceFilesCompanion Function({
      Value<int> id,
      Value<String> sourceType,
      Value<String> url,
      Value<String?> filePath,
      Value<String?> rawUrl,
      Value<bool> validationEnabled,
      Value<String?> validationStatus,
      Value<DateTime?> validatedAt,
      Value<String?> contentHash,
      Value<DateTime?> lastScannedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$SourceFilesTableReferences
    extends BaseReferences<_$AppDatabase, $SourceFilesTable, SourceFile> {
  $$SourceFilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProxiesTable, List<Proxy>> _proxiesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.proxies,
    aliasName: $_aliasNameGenerator(db.sourceFiles.id, db.proxies.sourceFileId),
  );

  $$ProxiesTableProcessedTableManager get proxiesRefs {
    final manager = $$ProxiesTableTableManager(
      $_db,
      $_db.proxies,
    ).filter((f) => f.sourceFileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_proxiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SourceFilesTableFilterComposer
    extends Composer<_$AppDatabase, $SourceFilesTable> {
  $$SourceFilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawUrl => $composableBuilder(
    column: $table.rawUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get validationEnabled => $composableBuilder(
    column: $table.validationEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get validationStatus => $composableBuilder(
    column: $table.validationStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get validatedAt => $composableBuilder(
    column: $table.validatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastScannedAt => $composableBuilder(
    column: $table.lastScannedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> proxiesRefs(
    Expression<bool> Function($$ProxiesTableFilterComposer f) f,
  ) {
    final $$ProxiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proxies,
      getReferencedColumn: (t) => t.sourceFileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProxiesTableFilterComposer(
            $db: $db,
            $table: $db.proxies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceFilesTableOrderingComposer
    extends Composer<_$AppDatabase, $SourceFilesTable> {
  $$SourceFilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawUrl => $composableBuilder(
    column: $table.rawUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get validationEnabled => $composableBuilder(
    column: $table.validationEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get validationStatus => $composableBuilder(
    column: $table.validationStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get validatedAt => $composableBuilder(
    column: $table.validatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastScannedAt => $composableBuilder(
    column: $table.lastScannedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SourceFilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SourceFilesTable> {
  $$SourceFilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
    column: $table.sourceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get rawUrl =>
      $composableBuilder(column: $table.rawUrl, builder: (column) => column);

  GeneratedColumn<bool> get validationEnabled => $composableBuilder(
    column: $table.validationEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get validationStatus => $composableBuilder(
    column: $table.validationStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get validatedAt => $composableBuilder(
    column: $table.validatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contentHash => $composableBuilder(
    column: $table.contentHash,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastScannedAt => $composableBuilder(
    column: $table.lastScannedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> proxiesRefs<T extends Object>(
    Expression<T> Function($$ProxiesTableAnnotationComposer a) f,
  ) {
    final $$ProxiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proxies,
      getReferencedColumn: (t) => t.sourceFileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProxiesTableAnnotationComposer(
            $db: $db,
            $table: $db.proxies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SourceFilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SourceFilesTable,
          SourceFile,
          $$SourceFilesTableFilterComposer,
          $$SourceFilesTableOrderingComposer,
          $$SourceFilesTableAnnotationComposer,
          $$SourceFilesTableCreateCompanionBuilder,
          $$SourceFilesTableUpdateCompanionBuilder,
          (SourceFile, $$SourceFilesTableReferences),
          SourceFile,
          PrefetchHooks Function({bool proxiesRefs})
        > {
  $$SourceFilesTableTableManager(_$AppDatabase db, $SourceFilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SourceFilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SourceFilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SourceFilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> sourceType = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> rawUrl = const Value.absent(),
                Value<bool> validationEnabled = const Value.absent(),
                Value<String?> validationStatus = const Value.absent(),
                Value<DateTime?> validatedAt = const Value.absent(),
                Value<String?> contentHash = const Value.absent(),
                Value<DateTime?> lastScannedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SourceFilesCompanion(
                id: id,
                sourceType: sourceType,
                url: url,
                filePath: filePath,
                rawUrl: rawUrl,
                validationEnabled: validationEnabled,
                validationStatus: validationStatus,
                validatedAt: validatedAt,
                contentHash: contentHash,
                lastScannedAt: lastScannedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String sourceType,
                required String url,
                Value<String?> filePath = const Value.absent(),
                Value<String?> rawUrl = const Value.absent(),
                Value<bool> validationEnabled = const Value.absent(),
                Value<String?> validationStatus = const Value.absent(),
                Value<DateTime?> validatedAt = const Value.absent(),
                Value<String?> contentHash = const Value.absent(),
                Value<DateTime?> lastScannedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SourceFilesCompanion.insert(
                id: id,
                sourceType: sourceType,
                url: url,
                filePath: filePath,
                rawUrl: rawUrl,
                validationEnabled: validationEnabled,
                validationStatus: validationStatus,
                validatedAt: validatedAt,
                contentHash: contentHash,
                lastScannedAt: lastScannedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SourceFilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({proxiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (proxiesRefs) db.proxies],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (proxiesRefs)
                    await $_getPrefetchedData<
                      SourceFile,
                      $SourceFilesTable,
                      Proxy
                    >(
                      currentTable: table,
                      referencedTable: $$SourceFilesTableReferences
                          ._proxiesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SourceFilesTableReferences(
                            db,
                            table,
                            p0,
                          ).proxiesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.sourceFileId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SourceFilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SourceFilesTable,
      SourceFile,
      $$SourceFilesTableFilterComposer,
      $$SourceFilesTableOrderingComposer,
      $$SourceFilesTableAnnotationComposer,
      $$SourceFilesTableCreateCompanionBuilder,
      $$SourceFilesTableUpdateCompanionBuilder,
      (SourceFile, $$SourceFilesTableReferences),
      SourceFile,
      PrefetchHooks Function({bool proxiesRefs})
    >;
typedef $$ProxiesTableCreateCompanionBuilder =
    ProxiesCompanion Function({
      Value<int> id,
      Value<int?> sourceFileId,
      required String server,
      required int port,
      required String secret,
      required String originalLink,
      required String normalizedLink,
      required String fingerprint,
      Value<String?> lastStatus,
      Value<int?> lastLatencyMs,
      Value<DateTime?> lastCheckedAt,
      Value<DateTime?> lastSuccessAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isFavorite,
      Value<bool> isHidden,
    });
typedef $$ProxiesTableUpdateCompanionBuilder =
    ProxiesCompanion Function({
      Value<int> id,
      Value<int?> sourceFileId,
      Value<String> server,
      Value<int> port,
      Value<String> secret,
      Value<String> originalLink,
      Value<String> normalizedLink,
      Value<String> fingerprint,
      Value<String?> lastStatus,
      Value<int?> lastLatencyMs,
      Value<DateTime?> lastCheckedAt,
      Value<DateTime?> lastSuccessAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<bool> isFavorite,
      Value<bool> isHidden,
    });

final class $$ProxiesTableReferences
    extends BaseReferences<_$AppDatabase, $ProxiesTable, Proxy> {
  $$ProxiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SourceFilesTable _sourceFileIdTable(_$AppDatabase db) =>
      db.sourceFiles.createAlias(
        $_aliasNameGenerator(db.proxies.sourceFileId, db.sourceFiles.id),
      );

  $$SourceFilesTableProcessedTableManager? get sourceFileId {
    final $_column = $_itemColumn<int>('source_file_id');
    if ($_column == null) return null;
    final manager = $$SourceFilesTableTableManager(
      $_db,
      $_db.sourceFiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceFileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ProxyChecksTable, List<ProxyCheck>>
  _proxyChecksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.proxyChecks,
    aliasName: $_aliasNameGenerator(db.proxies.id, db.proxyChecks.proxyId),
  );

  $$ProxyChecksTableProcessedTableManager get proxyChecksRefs {
    final manager = $$ProxyChecksTableTableManager(
      $_db,
      $_db.proxyChecks,
    ).filter((f) => f.proxyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_proxyChecksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProxiesTableFilterComposer
    extends Composer<_$AppDatabase, $ProxiesTable> {
  $$ProxiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get server => $composableBuilder(
    column: $table.server,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secret => $composableBuilder(
    column: $table.secret,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get originalLink => $composableBuilder(
    column: $table.originalLink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get normalizedLink => $composableBuilder(
    column: $table.normalizedLink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastStatus => $composableBuilder(
    column: $table.lastStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastLatencyMs => $composableBuilder(
    column: $table.lastLatencyMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastCheckedAt => $composableBuilder(
    column: $table.lastCheckedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSuccessAt => $composableBuilder(
    column: $table.lastSuccessAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isHidden => $composableBuilder(
    column: $table.isHidden,
    builder: (column) => ColumnFilters(column),
  );

  $$SourceFilesTableFilterComposer get sourceFileId {
    final $$SourceFilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceFileId,
      referencedTable: $db.sourceFiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceFilesTableFilterComposer(
            $db: $db,
            $table: $db.sourceFiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> proxyChecksRefs(
    Expression<bool> Function($$ProxyChecksTableFilterComposer f) f,
  ) {
    final $$ProxyChecksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proxyChecks,
      getReferencedColumn: (t) => t.proxyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProxyChecksTableFilterComposer(
            $db: $db,
            $table: $db.proxyChecks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProxiesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProxiesTable> {
  $$ProxiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get server => $composableBuilder(
    column: $table.server,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get port => $composableBuilder(
    column: $table.port,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secret => $composableBuilder(
    column: $table.secret,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get originalLink => $composableBuilder(
    column: $table.originalLink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get normalizedLink => $composableBuilder(
    column: $table.normalizedLink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastStatus => $composableBuilder(
    column: $table.lastStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastLatencyMs => $composableBuilder(
    column: $table.lastLatencyMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastCheckedAt => $composableBuilder(
    column: $table.lastCheckedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSuccessAt => $composableBuilder(
    column: $table.lastSuccessAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isHidden => $composableBuilder(
    column: $table.isHidden,
    builder: (column) => ColumnOrderings(column),
  );

  $$SourceFilesTableOrderingComposer get sourceFileId {
    final $$SourceFilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceFileId,
      referencedTable: $db.sourceFiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceFilesTableOrderingComposer(
            $db: $db,
            $table: $db.sourceFiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProxiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProxiesTable> {
  $$ProxiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get server =>
      $composableBuilder(column: $table.server, builder: (column) => column);

  GeneratedColumn<int> get port =>
      $composableBuilder(column: $table.port, builder: (column) => column);

  GeneratedColumn<String> get secret =>
      $composableBuilder(column: $table.secret, builder: (column) => column);

  GeneratedColumn<String> get originalLink => $composableBuilder(
    column: $table.originalLink,
    builder: (column) => column,
  );

  GeneratedColumn<String> get normalizedLink => $composableBuilder(
    column: $table.normalizedLink,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fingerprint => $composableBuilder(
    column: $table.fingerprint,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastStatus => $composableBuilder(
    column: $table.lastStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastLatencyMs => $composableBuilder(
    column: $table.lastLatencyMs,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastCheckedAt => $composableBuilder(
    column: $table.lastCheckedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSuccessAt => $composableBuilder(
    column: $table.lastSuccessAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
    column: $table.isFavorite,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isHidden =>
      $composableBuilder(column: $table.isHidden, builder: (column) => column);

  $$SourceFilesTableAnnotationComposer get sourceFileId {
    final $$SourceFilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceFileId,
      referencedTable: $db.sourceFiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SourceFilesTableAnnotationComposer(
            $db: $db,
            $table: $db.sourceFiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> proxyChecksRefs<T extends Object>(
    Expression<T> Function($$ProxyChecksTableAnnotationComposer a) f,
  ) {
    final $$ProxyChecksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.proxyChecks,
      getReferencedColumn: (t) => t.proxyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProxyChecksTableAnnotationComposer(
            $db: $db,
            $table: $db.proxyChecks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProxiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProxiesTable,
          Proxy,
          $$ProxiesTableFilterComposer,
          $$ProxiesTableOrderingComposer,
          $$ProxiesTableAnnotationComposer,
          $$ProxiesTableCreateCompanionBuilder,
          $$ProxiesTableUpdateCompanionBuilder,
          (Proxy, $$ProxiesTableReferences),
          Proxy,
          PrefetchHooks Function({bool sourceFileId, bool proxyChecksRefs})
        > {
  $$ProxiesTableTableManager(_$AppDatabase db, $ProxiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProxiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProxiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProxiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> sourceFileId = const Value.absent(),
                Value<String> server = const Value.absent(),
                Value<int> port = const Value.absent(),
                Value<String> secret = const Value.absent(),
                Value<String> originalLink = const Value.absent(),
                Value<String> normalizedLink = const Value.absent(),
                Value<String> fingerprint = const Value.absent(),
                Value<String?> lastStatus = const Value.absent(),
                Value<int?> lastLatencyMs = const Value.absent(),
                Value<DateTime?> lastCheckedAt = const Value.absent(),
                Value<DateTime?> lastSuccessAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isHidden = const Value.absent(),
              }) => ProxiesCompanion(
                id: id,
                sourceFileId: sourceFileId,
                server: server,
                port: port,
                secret: secret,
                originalLink: originalLink,
                normalizedLink: normalizedLink,
                fingerprint: fingerprint,
                lastStatus: lastStatus,
                lastLatencyMs: lastLatencyMs,
                lastCheckedAt: lastCheckedAt,
                lastSuccessAt: lastSuccessAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isFavorite: isFavorite,
                isHidden: isHidden,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> sourceFileId = const Value.absent(),
                required String server,
                required int port,
                required String secret,
                required String originalLink,
                required String normalizedLink,
                required String fingerprint,
                Value<String?> lastStatus = const Value.absent(),
                Value<int?> lastLatencyMs = const Value.absent(),
                Value<DateTime?> lastCheckedAt = const Value.absent(),
                Value<DateTime?> lastSuccessAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isFavorite = const Value.absent(),
                Value<bool> isHidden = const Value.absent(),
              }) => ProxiesCompanion.insert(
                id: id,
                sourceFileId: sourceFileId,
                server: server,
                port: port,
                secret: secret,
                originalLink: originalLink,
                normalizedLink: normalizedLink,
                fingerprint: fingerprint,
                lastStatus: lastStatus,
                lastLatencyMs: lastLatencyMs,
                lastCheckedAt: lastCheckedAt,
                lastSuccessAt: lastSuccessAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                isFavorite: isFavorite,
                isHidden: isHidden,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProxiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({sourceFileId = false, proxyChecksRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (proxyChecksRefs) db.proxyChecks,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sourceFileId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceFileId,
                                    referencedTable: $$ProxiesTableReferences
                                        ._sourceFileIdTable(db),
                                    referencedColumn: $$ProxiesTableReferences
                                        ._sourceFileIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (proxyChecksRefs)
                        await $_getPrefetchedData<
                          Proxy,
                          $ProxiesTable,
                          ProxyCheck
                        >(
                          currentTable: table,
                          referencedTable: $$ProxiesTableReferences
                              ._proxyChecksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProxiesTableReferences(
                                db,
                                table,
                                p0,
                              ).proxyChecksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.proxyId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProxiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProxiesTable,
      Proxy,
      $$ProxiesTableFilterComposer,
      $$ProxiesTableOrderingComposer,
      $$ProxiesTableAnnotationComposer,
      $$ProxiesTableCreateCompanionBuilder,
      $$ProxiesTableUpdateCompanionBuilder,
      (Proxy, $$ProxiesTableReferences),
      Proxy,
      PrefetchHooks Function({bool sourceFileId, bool proxyChecksRefs})
    >;
typedef $$ProxyChecksTableCreateCompanionBuilder =
    ProxyChecksCompanion Function({
      Value<int> id,
      required int proxyId,
      Value<DateTime> checkedAt,
      required String status,
      Value<int?> latencyMs,
      Value<String?> resolvedIp,
      Value<String?> errorCode,
      Value<String?> errorMessage,
      Value<String> testType,
    });
typedef $$ProxyChecksTableUpdateCompanionBuilder =
    ProxyChecksCompanion Function({
      Value<int> id,
      Value<int> proxyId,
      Value<DateTime> checkedAt,
      Value<String> status,
      Value<int?> latencyMs,
      Value<String?> resolvedIp,
      Value<String?> errorCode,
      Value<String?> errorMessage,
      Value<String> testType,
    });

final class $$ProxyChecksTableReferences
    extends BaseReferences<_$AppDatabase, $ProxyChecksTable, ProxyCheck> {
  $$ProxyChecksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProxiesTable _proxyIdTable(_$AppDatabase db) => db.proxies
      .createAlias($_aliasNameGenerator(db.proxyChecks.proxyId, db.proxies.id));

  $$ProxiesTableProcessedTableManager get proxyId {
    final $_column = $_itemColumn<int>('proxy_id')!;

    final manager = $$ProxiesTableTableManager(
      $_db,
      $_db.proxies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_proxyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProxyChecksTableFilterComposer
    extends Composer<_$AppDatabase, $ProxyChecksTable> {
  $$ProxyChecksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get checkedAt => $composableBuilder(
    column: $table.checkedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get latencyMs => $composableBuilder(
    column: $table.latencyMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resolvedIp => $composableBuilder(
    column: $table.resolvedIp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testType => $composableBuilder(
    column: $table.testType,
    builder: (column) => ColumnFilters(column),
  );

  $$ProxiesTableFilterComposer get proxyId {
    final $$ProxiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proxyId,
      referencedTable: $db.proxies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProxiesTableFilterComposer(
            $db: $db,
            $table: $db.proxies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProxyChecksTableOrderingComposer
    extends Composer<_$AppDatabase, $ProxyChecksTable> {
  $$ProxyChecksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get checkedAt => $composableBuilder(
    column: $table.checkedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get latencyMs => $composableBuilder(
    column: $table.latencyMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resolvedIp => $composableBuilder(
    column: $table.resolvedIp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorCode => $composableBuilder(
    column: $table.errorCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testType => $composableBuilder(
    column: $table.testType,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProxiesTableOrderingComposer get proxyId {
    final $$ProxiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proxyId,
      referencedTable: $db.proxies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProxiesTableOrderingComposer(
            $db: $db,
            $table: $db.proxies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProxyChecksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProxyChecksTable> {
  $$ProxyChecksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get checkedAt =>
      $composableBuilder(column: $table.checkedAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get latencyMs =>
      $composableBuilder(column: $table.latencyMs, builder: (column) => column);

  GeneratedColumn<String> get resolvedIp => $composableBuilder(
    column: $table.resolvedIp,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorCode =>
      $composableBuilder(column: $table.errorCode, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get testType =>
      $composableBuilder(column: $table.testType, builder: (column) => column);

  $$ProxiesTableAnnotationComposer get proxyId {
    final $$ProxiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.proxyId,
      referencedTable: $db.proxies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProxiesTableAnnotationComposer(
            $db: $db,
            $table: $db.proxies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProxyChecksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProxyChecksTable,
          ProxyCheck,
          $$ProxyChecksTableFilterComposer,
          $$ProxyChecksTableOrderingComposer,
          $$ProxyChecksTableAnnotationComposer,
          $$ProxyChecksTableCreateCompanionBuilder,
          $$ProxyChecksTableUpdateCompanionBuilder,
          (ProxyCheck, $$ProxyChecksTableReferences),
          ProxyCheck,
          PrefetchHooks Function({bool proxyId})
        > {
  $$ProxyChecksTableTableManager(_$AppDatabase db, $ProxyChecksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProxyChecksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProxyChecksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProxyChecksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> proxyId = const Value.absent(),
                Value<DateTime> checkedAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> latencyMs = const Value.absent(),
                Value<String?> resolvedIp = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<String> testType = const Value.absent(),
              }) => ProxyChecksCompanion(
                id: id,
                proxyId: proxyId,
                checkedAt: checkedAt,
                status: status,
                latencyMs: latencyMs,
                resolvedIp: resolvedIp,
                errorCode: errorCode,
                errorMessage: errorMessage,
                testType: testType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int proxyId,
                Value<DateTime> checkedAt = const Value.absent(),
                required String status,
                Value<int?> latencyMs = const Value.absent(),
                Value<String?> resolvedIp = const Value.absent(),
                Value<String?> errorCode = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<String> testType = const Value.absent(),
              }) => ProxyChecksCompanion.insert(
                id: id,
                proxyId: proxyId,
                checkedAt: checkedAt,
                status: status,
                latencyMs: latencyMs,
                resolvedIp: resolvedIp,
                errorCode: errorCode,
                errorMessage: errorMessage,
                testType: testType,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProxyChecksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({proxyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (proxyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.proxyId,
                                referencedTable: $$ProxyChecksTableReferences
                                    ._proxyIdTable(db),
                                referencedColumn: $$ProxyChecksTableReferences
                                    ._proxyIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProxyChecksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProxyChecksTable,
      ProxyCheck,
      $$ProxyChecksTableFilterComposer,
      $$ProxyChecksTableOrderingComposer,
      $$ProxyChecksTableAnnotationComposer,
      $$ProxyChecksTableCreateCompanionBuilder,
      $$ProxyChecksTableUpdateCompanionBuilder,
      (ProxyCheck, $$ProxyChecksTableReferences),
      ProxyCheck,
      PrefetchHooks Function({bool proxyId})
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SourceFilesTableTableManager get sourceFiles =>
      $$SourceFilesTableTableManager(_db, _db.sourceFiles);
  $$ProxiesTableTableManager get proxies =>
      $$ProxiesTableTableManager(_db, _db.proxies);
  $$ProxyChecksTableTableManager get proxyChecks =>
      $$ProxyChecksTableTableManager(_db, _db.proxyChecks);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
