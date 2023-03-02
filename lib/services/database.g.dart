// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProcessorsTable extends Processors with TableInfo<$ProcessorsTable, Processor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $ProcessorsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name =
      GeneratedColumn<String>('name', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [id, name];

  @override
  String get aliasedName => _alias ?? 'processors';

  @override
  String get actualTableName => 'processors';

  @override
  VerificationContext validateIntegrity(Insertable<Processor> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  Processor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Processor(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $ProcessorsTable createAlias(String alias) {
    return $ProcessorsTable(attachedDatabase, alias);
  }
}

class Processor extends DataClass implements Insertable<Processor> {
  final int id;
  final String name;

  const Processor({required this.id, required this.name});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ProcessorsCompanion toCompanion(bool nullToAbsent) {
    return ProcessorsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Processor.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Processor(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Processor copyWith({int? id, String? name}) => Processor(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  @override
  String toString() {
    return (StringBuffer('Processor(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Processor && other.id == this.id && other.name == this.name);
}

class ProcessorsCompanion extends UpdateCompanion<Processor> {
  final Value<int> id;
  final Value<String> name;

  const ProcessorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });

  ProcessorsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);

  static Insertable<Processor> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ProcessorsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ProcessorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcessorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $RamTable extends Ram with TableInfo<$RamTable, RamData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $RamTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ramFromMeta = const VerificationMeta('ramFrom');
  @override
  late final GeneratedColumn<int> ramFrom =
      GeneratedColumn<int>('ram_from', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ramToMeta = const VerificationMeta('ramTo');
  @override
  late final GeneratedColumn<int> ramTo =
      GeneratedColumn<int>('ram_to', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [id, ramFrom, ramTo];

  @override
  String get aliasedName => _alias ?? 'ram';

  @override
  String get actualTableName => 'ram';

  @override
  VerificationContext validateIntegrity(Insertable<RamData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ram_from')) {
      context.handle(_ramFromMeta, ramFrom.isAcceptableOrUnknown(data['ram_from']!, _ramFromMeta));
    } else if (isInserting) {
      context.missing(_ramFromMeta);
    }
    if (data.containsKey('ram_to')) {
      context.handle(_ramToMeta, ramTo.isAcceptableOrUnknown(data['ram_to']!, _ramToMeta));
    } else if (isInserting) {
      context.missing(_ramToMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  RamData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RamData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ramFrom: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}ram_from'])!,
      ramTo: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}ram_to'])!,
    );
  }

  @override
  $RamTable createAlias(String alias) {
    return $RamTable(attachedDatabase, alias);
  }
}

class RamData extends DataClass implements Insertable<RamData> {
  final int id;
  final int ramFrom;
  final int ramTo;

  const RamData({required this.id, required this.ramFrom, required this.ramTo});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ram_from'] = Variable<int>(ramFrom);
    map['ram_to'] = Variable<int>(ramTo);
    return map;
  }

  RamCompanion toCompanion(bool nullToAbsent) {
    return RamCompanion(
      id: Value(id),
      ramFrom: Value(ramFrom),
      ramTo: Value(ramTo),
    );
  }

  factory RamData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RamData(
      id: serializer.fromJson<int>(json['id']),
      ramFrom: serializer.fromJson<int>(json['ramFrom']),
      ramTo: serializer.fromJson<int>(json['ramTo']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ramFrom': serializer.toJson<int>(ramFrom),
      'ramTo': serializer.toJson<int>(ramTo),
    };
  }

  RamData copyWith({int? id, int? ramFrom, int? ramTo}) => RamData(
        id: id ?? this.id,
        ramFrom: ramFrom ?? this.ramFrom,
        ramTo: ramTo ?? this.ramTo,
      );

  @override
  String toString() {
    return (StringBuffer('RamData(')
          ..write('id: $id, ')
          ..write('ramFrom: $ramFrom, ')
          ..write('ramTo: $ramTo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ramFrom, ramTo);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RamData && other.id == this.id && other.ramFrom == this.ramFrom && other.ramTo == this.ramTo);
}

class RamCompanion extends UpdateCompanion<RamData> {
  final Value<int> id;
  final Value<int> ramFrom;
  final Value<int> ramTo;

  const RamCompanion({
    this.id = const Value.absent(),
    this.ramFrom = const Value.absent(),
    this.ramTo = const Value.absent(),
  });

  RamCompanion.insert({
    this.id = const Value.absent(),
    required int ramFrom,
    required int ramTo,
  })  : ramFrom = Value(ramFrom),
        ramTo = Value(ramTo);

  static Insertable<RamData> custom({
    Expression<int>? id,
    Expression<int>? ramFrom,
    Expression<int>? ramTo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ramFrom != null) 'ram_from': ramFrom,
      if (ramTo != null) 'ram_to': ramTo,
    });
  }

  RamCompanion copyWith({Value<int>? id, Value<int>? ramFrom, Value<int>? ramTo}) {
    return RamCompanion(
      id: id ?? this.id,
      ramFrom: ramFrom ?? this.ramFrom,
      ramTo: ramTo ?? this.ramTo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ramFrom.present) {
      map['ram_from'] = Variable<int>(ramFrom.value);
    }
    if (ramTo.present) {
      map['ram_to'] = Variable<int>(ramTo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RamCompanion(')
          ..write('id: $id, ')
          ..write('ramFrom: $ramFrom, ')
          ..write('ramTo: $ramTo')
          ..write(')'))
        .toString();
  }
}

class $OperatingSystemsTable extends OperatingSystems with TableInfo<$OperatingSystemsTable, OperatingSystem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $OperatingSystemsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name =
      GeneratedColumn<String>('name', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [id, name];

  @override
  String get aliasedName => _alias ?? 'operating_systems';

  @override
  String get actualTableName => 'operating_systems';

  @override
  VerificationContext validateIntegrity(Insertable<OperatingSystem> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  OperatingSystem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperatingSystem(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $OperatingSystemsTable createAlias(String alias) {
    return $OperatingSystemsTable(attachedDatabase, alias);
  }
}

class OperatingSystem extends DataClass implements Insertable<OperatingSystem> {
  final int id;
  final String name;

  const OperatingSystem({required this.id, required this.name});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  OperatingSystemsCompanion toCompanion(bool nullToAbsent) {
    return OperatingSystemsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory OperatingSystem.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperatingSystem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  OperatingSystem copyWith({int? id, String? name}) => OperatingSystem(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  @override
  String toString() {
    return (StringBuffer('OperatingSystem(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is OperatingSystem && other.id == this.id && other.name == this.name);
}

class OperatingSystemsCompanion extends UpdateCompanion<OperatingSystem> {
  final Value<int> id;
  final Value<String> name;

  const OperatingSystemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });

  OperatingSystemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);

  static Insertable<OperatingSystem> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  OperatingSystemsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return OperatingSystemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperatingSystemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $StorageTable extends Storage with TableInfo<$StorageTable, StorageData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $StorageTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _storageFromMeta = const VerificationMeta('storageFrom');
  @override
  late final GeneratedColumn<int> storageFrom =
      GeneratedColumn<int>('storage_from', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _storageToMeta = const VerificationMeta('storageTo');
  @override
  late final GeneratedColumn<int> storageTo =
      GeneratedColumn<int>('storage_to', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [id, storageFrom, storageTo];

  @override
  String get aliasedName => _alias ?? 'storage';

  @override
  String get actualTableName => 'storage';

  @override
  VerificationContext validateIntegrity(Insertable<StorageData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('storage_from')) {
      context.handle(_storageFromMeta, storageFrom.isAcceptableOrUnknown(data['storage_from']!, _storageFromMeta));
    } else if (isInserting) {
      context.missing(_storageFromMeta);
    }
    if (data.containsKey('storage_to')) {
      context.handle(_storageToMeta, storageTo.isAcceptableOrUnknown(data['storage_to']!, _storageToMeta));
    } else if (isInserting) {
      context.missing(_storageToMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  StorageData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      storageFrom: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}storage_from'])!,
      storageTo: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}storage_to'])!,
    );
  }

  @override
  $StorageTable createAlias(String alias) {
    return $StorageTable(attachedDatabase, alias);
  }
}

class StorageData extends DataClass implements Insertable<StorageData> {
  final int id;
  final int storageFrom;
  final int storageTo;

  const StorageData({required this.id, required this.storageFrom, required this.storageTo});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['storage_from'] = Variable<int>(storageFrom);
    map['storage_to'] = Variable<int>(storageTo);
    return map;
  }

  StorageCompanion toCompanion(bool nullToAbsent) {
    return StorageCompanion(
      id: Value(id),
      storageFrom: Value(storageFrom),
      storageTo: Value(storageTo),
    );
  }

  factory StorageData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageData(
      id: serializer.fromJson<int>(json['id']),
      storageFrom: serializer.fromJson<int>(json['storageFrom']),
      storageTo: serializer.fromJson<int>(json['storageTo']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'storageFrom': serializer.toJson<int>(storageFrom),
      'storageTo': serializer.toJson<int>(storageTo),
    };
  }

  StorageData copyWith({int? id, int? storageFrom, int? storageTo}) => StorageData(
        id: id ?? this.id,
        storageFrom: storageFrom ?? this.storageFrom,
        storageTo: storageTo ?? this.storageTo,
      );

  @override
  String toString() {
    return (StringBuffer('StorageData(')
          ..write('id: $id, ')
          ..write('storageFrom: $storageFrom, ')
          ..write('storageTo: $storageTo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, storageFrom, storageTo);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageData &&
          other.id == this.id &&
          other.storageFrom == this.storageFrom &&
          other.storageTo == this.storageTo);
}

class StorageCompanion extends UpdateCompanion<StorageData> {
  final Value<int> id;
  final Value<int> storageFrom;
  final Value<int> storageTo;

  const StorageCompanion({
    this.id = const Value.absent(),
    this.storageFrom = const Value.absent(),
    this.storageTo = const Value.absent(),
  });

  StorageCompanion.insert({
    this.id = const Value.absent(),
    required int storageFrom,
    required int storageTo,
  })  : storageFrom = Value(storageFrom),
        storageTo = Value(storageTo);

  static Insertable<StorageData> custom({
    Expression<int>? id,
    Expression<int>? storageFrom,
    Expression<int>? storageTo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (storageFrom != null) 'storage_from': storageFrom,
      if (storageTo != null) 'storage_to': storageTo,
    });
  }

  StorageCompanion copyWith({Value<int>? id, Value<int>? storageFrom, Value<int>? storageTo}) {
    return StorageCompanion(
      id: id ?? this.id,
      storageFrom: storageFrom ?? this.storageFrom,
      storageTo: storageTo ?? this.storageTo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (storageFrom.present) {
      map['storage_from'] = Variable<int>(storageFrom.value);
    }
    if (storageTo.present) {
      map['storage_to'] = Variable<int>(storageTo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageCompanion(')
          ..write('id: $id, ')
          ..write('storageFrom: $storageFrom, ')
          ..write('storageTo: $storageTo')
          ..write(')'))
        .toString();
  }
}

class $DepartmentsTable extends Departments with TableInfo<$DepartmentsTable, Department> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $DepartmentsTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name =
      GeneratedColumn<String>('name', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns => [id, name];

  @override
  String get aliasedName => _alias ?? 'departments';

  @override
  String get actualTableName => 'departments';

  @override
  VerificationContext validateIntegrity(Insertable<Department> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  Department map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Department(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $DepartmentsTable createAlias(String alias) {
    return $DepartmentsTable(attachedDatabase, alias);
  }
}

class Department extends DataClass implements Insertable<Department> {
  final int id;
  final String name;

  const Department({required this.id, required this.name});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  DepartmentsCompanion toCompanion(bool nullToAbsent) {
    return DepartmentsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Department.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Department(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Department copyWith({int? id, String? name}) => Department(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  @override
  String toString() {
    return (StringBuffer('Department(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Department && other.id == this.id && other.name == this.name);
}

class DepartmentsCompanion extends UpdateCompanion<Department> {
  final Value<int> id;
  final Value<String> name;

  const DepartmentsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });

  DepartmentsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);

  static Insertable<Department> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  DepartmentsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return DepartmentsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DepartmentsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $InventoryTableTable extends InventoryTable with TableInfo<$InventoryTableTable, InventoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $InventoryTableTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _processorsIdMeta = const VerificationMeta('processorsId');
  @override
  late final GeneratedColumn<int> processorsId = GeneratedColumn<int>('processors_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES processors (id)'));
  static const VerificationMeta _ramsRangeMeta = const VerificationMeta('ramsRange');
  @override
  late final GeneratedColumn<int> ramsRange = GeneratedColumn<int>('rams_range', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES ram (id)'));
  static const VerificationMeta _osIdMeta = const VerificationMeta('osId');
  @override
  late final GeneratedColumn<int> osId = GeneratedColumn<int>('os_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES operating_systems (id)'));
  static const VerificationMeta _storageRangeMeta = const VerificationMeta('storageRange');
  @override
  late final GeneratedColumn<int> storageRange = GeneratedColumn<int>('storage_range', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES storage (id)'));
  static const VerificationMeta _departmentIdMeta = const VerificationMeta('departmentId');
  @override
  late final GeneratedColumn<int> departmentId = GeneratedColumn<int>('department_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES departments (id)'));
  static const VerificationMeta _purchaseDateMeta = const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>('purchase_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _assignToMeta = const VerificationMeta('assignTo');
  @override
  late final GeneratedColumn<String> assignTo =
      GeneratedColumn<String>('assign_to', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns =>
      [id, processorsId, ramsRange, osId, storageRange, departmentId, purchaseDate, assignTo];

  @override
  String get aliasedName => _alias ?? 'inventory_table';

  @override
  String get actualTableName => 'inventory_table';

  @override
  VerificationContext validateIntegrity(Insertable<InventoryData> instance, {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('processors_id')) {
      context.handle(_processorsIdMeta, processorsId.isAcceptableOrUnknown(data['processors_id']!, _processorsIdMeta));
    } else if (isInserting) {
      context.missing(_processorsIdMeta);
    }
    if (data.containsKey('rams_range')) {
      context.handle(_ramsRangeMeta, ramsRange.isAcceptableOrUnknown(data['rams_range']!, _ramsRangeMeta));
    } else if (isInserting) {
      context.missing(_ramsRangeMeta);
    }
    if (data.containsKey('os_id')) {
      context.handle(_osIdMeta, osId.isAcceptableOrUnknown(data['os_id']!, _osIdMeta));
    } else if (isInserting) {
      context.missing(_osIdMeta);
    }
    if (data.containsKey('storage_range')) {
      context.handle(_storageRangeMeta, storageRange.isAcceptableOrUnknown(data['storage_range']!, _storageRangeMeta));
    } else if (isInserting) {
      context.missing(_storageRangeMeta);
    }
    if (data.containsKey('department_id')) {
      context.handle(_departmentIdMeta, departmentId.isAcceptableOrUnknown(data['department_id']!, _departmentIdMeta));
    } else if (isInserting) {
      context.missing(_departmentIdMeta);
    }
    if (data.containsKey('purchase_date')) {
      context.handle(_purchaseDateMeta, purchaseDate.isAcceptableOrUnknown(data['purchase_date']!, _purchaseDateMeta));
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('assign_to')) {
      context.handle(_assignToMeta, assignTo.isAcceptableOrUnknown(data['assign_to']!, _assignToMeta));
    } else if (isInserting) {
      context.missing(_assignToMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  InventoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryData(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      processorsId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}processors_id'])!,
      ramsRange: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}rams_range'])!,
      osId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}os_id'])!,
      storageRange: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}storage_range'])!,
      departmentId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}department_id'])!,
      purchaseDate: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}purchase_date'])!,
      assignTo: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}assign_to'])!,
    );
  }

  @override
  $InventoryTableTable createAlias(String alias) {
    return $InventoryTableTable(attachedDatabase, alias);
  }
}

class InventoryData extends DataClass implements Insertable<InventoryData> {
  final int id;
  final int processorsId;
  final int ramsRange;
  final int osId;
  final int storageRange;
  final int departmentId;
  final DateTime purchaseDate;
  final String assignTo;

  const InventoryData(
      {required this.id,
      required this.processorsId,
      required this.ramsRange,
      required this.osId,
      required this.storageRange,
      required this.departmentId,
      required this.purchaseDate,
      required this.assignTo});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['processors_id'] = Variable<int>(processorsId);
    map['rams_range'] = Variable<int>(ramsRange);
    map['os_id'] = Variable<int>(osId);
    map['storage_range'] = Variable<int>(storageRange);
    map['department_id'] = Variable<int>(departmentId);
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    map['assign_to'] = Variable<String>(assignTo);
    return map;
  }

  InventoryTableCompanion toCompanion(bool nullToAbsent) {
    return InventoryTableCompanion(
      id: Value(id),
      processorsId: Value(processorsId),
      ramsRange: Value(ramsRange),
      osId: Value(osId),
      storageRange: Value(storageRange),
      departmentId: Value(departmentId),
      purchaseDate: Value(purchaseDate),
      assignTo: Value(assignTo),
    );
  }

  factory InventoryData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryData(
      id: serializer.fromJson<int>(json['id']),
      processorsId: serializer.fromJson<int>(json['processorsId']),
      ramsRange: serializer.fromJson<int>(json['ramsRange']),
      osId: serializer.fromJson<int>(json['osId']),
      storageRange: serializer.fromJson<int>(json['storageRange']),
      departmentId: serializer.fromJson<int>(json['departmentId']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      assignTo: serializer.fromJson<String>(json['assignTo']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'processorsId': serializer.toJson<int>(processorsId),
      'ramsRange': serializer.toJson<int>(ramsRange),
      'osId': serializer.toJson<int>(osId),
      'storageRange': serializer.toJson<int>(storageRange),
      'departmentId': serializer.toJson<int>(departmentId),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'assignTo': serializer.toJson<String>(assignTo),
    };
  }

  InventoryData copyWith(
          {int? id,
          int? processorsId,
          int? ramsRange,
          int? osId,
          int? storageRange,
          int? departmentId,
          DateTime? purchaseDate,
          String? assignTo}) =>
      InventoryData(
        id: id ?? this.id,
        processorsId: processorsId ?? this.processorsId,
        ramsRange: ramsRange ?? this.ramsRange,
        osId: osId ?? this.osId,
        storageRange: storageRange ?? this.storageRange,
        departmentId: departmentId ?? this.departmentId,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        assignTo: assignTo ?? this.assignTo,
      );

  @override
  String toString() {
    return (StringBuffer('InventoryData(')
          ..write('id: $id, ')
          ..write('processorsId: $processorsId, ')
          ..write('ramsRange: $ramsRange, ')
          ..write('osId: $osId, ')
          ..write('storageRange: $storageRange, ')
          ..write('departmentId: $departmentId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('assignTo: $assignTo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, processorsId, ramsRange, osId, storageRange, departmentId, purchaseDate, assignTo);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryData &&
          other.id == this.id &&
          other.processorsId == this.processorsId &&
          other.ramsRange == this.ramsRange &&
          other.osId == this.osId &&
          other.storageRange == this.storageRange &&
          other.departmentId == this.departmentId &&
          other.purchaseDate == this.purchaseDate &&
          other.assignTo == this.assignTo);
}

class InventoryTableCompanion extends UpdateCompanion<InventoryData> {
  final Value<int> id;
  final Value<int> processorsId;
  final Value<int> ramsRange;
  final Value<int> osId;
  final Value<int> storageRange;
  final Value<int> departmentId;
  final Value<DateTime> purchaseDate;
  final Value<String> assignTo;

  const InventoryTableCompanion({
    this.id = const Value.absent(),
    this.processorsId = const Value.absent(),
    this.ramsRange = const Value.absent(),
    this.osId = const Value.absent(),
    this.storageRange = const Value.absent(),
    this.departmentId = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.assignTo = const Value.absent(),
  });

  InventoryTableCompanion.insert({
    this.id = const Value.absent(),
    required int processorsId,
    required int ramsRange,
    required int osId,
    required int storageRange,
    required int departmentId,
    required DateTime purchaseDate,
    required String assignTo,
  })  : processorsId = Value(processorsId),
        ramsRange = Value(ramsRange),
        osId = Value(osId),
        storageRange = Value(storageRange),
        departmentId = Value(departmentId),
        purchaseDate = Value(purchaseDate),
        assignTo = Value(assignTo);

  static Insertable<InventoryData> custom({
    Expression<int>? id,
    Expression<int>? processorsId,
    Expression<int>? ramsRange,
    Expression<int>? osId,
    Expression<int>? storageRange,
    Expression<int>? departmentId,
    Expression<DateTime>? purchaseDate,
    Expression<String>? assignTo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (processorsId != null) 'processors_id': processorsId,
      if (ramsRange != null) 'rams_range': ramsRange,
      if (osId != null) 'os_id': osId,
      if (storageRange != null) 'storage_range': storageRange,
      if (departmentId != null) 'department_id': departmentId,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (assignTo != null) 'assign_to': assignTo,
    });
  }

  InventoryTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? processorsId,
      Value<int>? ramsRange,
      Value<int>? osId,
      Value<int>? storageRange,
      Value<int>? departmentId,
      Value<DateTime>? purchaseDate,
      Value<String>? assignTo}) {
    return InventoryTableCompanion(
      id: id ?? this.id,
      processorsId: processorsId ?? this.processorsId,
      ramsRange: ramsRange ?? this.ramsRange,
      osId: osId ?? this.osId,
      storageRange: storageRange ?? this.storageRange,
      departmentId: departmentId ?? this.departmentId,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      assignTo: assignTo ?? this.assignTo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (processorsId.present) {
      map['processors_id'] = Variable<int>(processorsId.value);
    }
    if (ramsRange.present) {
      map['rams_range'] = Variable<int>(ramsRange.value);
    }
    if (osId.present) {
      map['os_id'] = Variable<int>(osId.value);
    }
    if (storageRange.present) {
      map['storage_range'] = Variable<int>(storageRange.value);
    }
    if (departmentId.present) {
      map['department_id'] = Variable<int>(departmentId.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (assignTo.present) {
      map['assign_to'] = Variable<String>(assignTo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryTableCompanion(')
          ..write('id: $id, ')
          ..write('processorsId: $processorsId, ')
          ..write('ramsRange: $ramsRange, ')
          ..write('osId: $osId, ')
          ..write('storageRange: $storageRange, ')
          ..write('departmentId: $departmentId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('assignTo: $assignTo')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ProcessorsTable processors = $ProcessorsTable(this);
  late final $RamTable ram = $RamTable(this);
  late final $OperatingSystemsTable operatingSystems = $OperatingSystemsTable(this);
  late final $StorageTable storage = $StorageTable(this);
  late final $DepartmentsTable departments = $DepartmentsTable(this);
  late final $InventoryTableTable inventoryTable = $InventoryTableTable(this);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [processors, ram, operatingSystems, storage, departments, inventoryTable];
}
