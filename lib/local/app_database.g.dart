// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MateriasTable extends Materias
    with TableInfo<$MateriasTable, MateriaRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MateriasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notaMinimaMeta = const VerificationMeta(
    'notaMinima',
  );
  @override
  late final GeneratedColumn<double> notaMinima = GeneratedColumn<double>(
    'nota_minima',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notaMaximaMeta = const VerificationMeta(
    'notaMaxima',
  );
  @override
  late final GeneratedColumn<double> notaMaxima = GeneratedColumn<double>(
    'nota_maxima',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pendingSyncMeta = const VerificationMeta(
    'pendingSync',
  );
  @override
  late final GeneratedColumn<bool> pendingSync = GeneratedColumn<bool>(
    'pending_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pending_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    notaMinima,
    notaMaxima,
    updatedAt,
    pendingSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'materias';
  @override
  VerificationContext validateIntegrity(
    Insertable<MateriaRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('nota_minima')) {
      context.handle(
        _notaMinimaMeta,
        notaMinima.isAcceptableOrUnknown(data['nota_minima']!, _notaMinimaMeta),
      );
    } else if (isInserting) {
      context.missing(_notaMinimaMeta);
    }
    if (data.containsKey('nota_maxima')) {
      context.handle(
        _notaMaximaMeta,
        notaMaxima.isAcceptableOrUnknown(data['nota_maxima']!, _notaMaximaMeta),
      );
    } else if (isInserting) {
      context.missing(_notaMaximaMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('pending_sync')) {
      context.handle(
        _pendingSyncMeta,
        pendingSync.isAcceptableOrUnknown(
          data['pending_sync']!,
          _pendingSyncMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MateriaRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MateriaRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      notaMinima: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}nota_minima'],
      )!,
      notaMaxima: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}nota_maxima'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      pendingSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pending_sync'],
      )!,
    );
  }

  @override
  $MateriasTable createAlias(String alias) {
    return $MateriasTable(attachedDatabase, alias);
  }
}

class MateriaRow extends DataClass implements Insertable<MateriaRow> {
  final int id;
  final String nombre;
  final double notaMinima;
  final double notaMaxima;
  final DateTime updatedAt;
  final bool pendingSync;
  const MateriaRow({
    required this.id,
    required this.nombre,
    required this.notaMinima,
    required this.notaMaxima,
    required this.updatedAt,
    required this.pendingSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['nota_minima'] = Variable<double>(notaMinima);
    map['nota_maxima'] = Variable<double>(notaMaxima);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['pending_sync'] = Variable<bool>(pendingSync);
    return map;
  }

  MateriasCompanion toCompanion(bool nullToAbsent) {
    return MateriasCompanion(
      id: Value(id),
      nombre: Value(nombre),
      notaMinima: Value(notaMinima),
      notaMaxima: Value(notaMaxima),
      updatedAt: Value(updatedAt),
      pendingSync: Value(pendingSync),
    );
  }

  factory MateriaRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MateriaRow(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      notaMinima: serializer.fromJson<double>(json['notaMinima']),
      notaMaxima: serializer.fromJson<double>(json['notaMaxima']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      pendingSync: serializer.fromJson<bool>(json['pendingSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'notaMinima': serializer.toJson<double>(notaMinima),
      'notaMaxima': serializer.toJson<double>(notaMaxima),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'pendingSync': serializer.toJson<bool>(pendingSync),
    };
  }

  MateriaRow copyWith({
    int? id,
    String? nombre,
    double? notaMinima,
    double? notaMaxima,
    DateTime? updatedAt,
    bool? pendingSync,
  }) => MateriaRow(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    notaMinima: notaMinima ?? this.notaMinima,
    notaMaxima: notaMaxima ?? this.notaMaxima,
    updatedAt: updatedAt ?? this.updatedAt,
    pendingSync: pendingSync ?? this.pendingSync,
  );
  MateriaRow copyWithCompanion(MateriasCompanion data) {
    return MateriaRow(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      notaMinima: data.notaMinima.present
          ? data.notaMinima.value
          : this.notaMinima,
      notaMaxima: data.notaMaxima.present
          ? data.notaMaxima.value
          : this.notaMaxima,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      pendingSync: data.pendingSync.present
          ? data.pendingSync.value
          : this.pendingSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MateriaRow(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('notaMinima: $notaMinima, ')
          ..write('notaMaxima: $notaMaxima, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('pendingSync: $pendingSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nombre, notaMinima, notaMaxima, updatedAt, pendingSync);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MateriaRow &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.notaMinima == this.notaMinima &&
          other.notaMaxima == this.notaMaxima &&
          other.updatedAt == this.updatedAt &&
          other.pendingSync == this.pendingSync);
}

class MateriasCompanion extends UpdateCompanion<MateriaRow> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<double> notaMinima;
  final Value<double> notaMaxima;
  final Value<DateTime> updatedAt;
  final Value<bool> pendingSync;
  const MateriasCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.notaMinima = const Value.absent(),
    this.notaMaxima = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
  });
  MateriasCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required double notaMinima,
    required double notaMaxima,
    required DateTime updatedAt,
    this.pendingSync = const Value.absent(),
  }) : nombre = Value(nombre),
       notaMinima = Value(notaMinima),
       notaMaxima = Value(notaMaxima),
       updatedAt = Value(updatedAt);
  static Insertable<MateriaRow> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<double>? notaMinima,
    Expression<double>? notaMaxima,
    Expression<DateTime>? updatedAt,
    Expression<bool>? pendingSync,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (notaMinima != null) 'nota_minima': notaMinima,
      if (notaMaxima != null) 'nota_maxima': notaMaxima,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (pendingSync != null) 'pending_sync': pendingSync,
    });
  }

  MateriasCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<double>? notaMinima,
    Value<double>? notaMaxima,
    Value<DateTime>? updatedAt,
    Value<bool>? pendingSync,
  }) {
    return MateriasCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      notaMinima: notaMinima ?? this.notaMinima,
      notaMaxima: notaMaxima ?? this.notaMaxima,
      updatedAt: updatedAt ?? this.updatedAt,
      pendingSync: pendingSync ?? this.pendingSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (notaMinima.present) {
      map['nota_minima'] = Variable<double>(notaMinima.value);
    }
    if (notaMaxima.present) {
      map['nota_maxima'] = Variable<double>(notaMaxima.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (pendingSync.present) {
      map['pending_sync'] = Variable<bool>(pendingSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MateriasCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('notaMinima: $notaMinima, ')
          ..write('notaMaxima: $notaMaxima, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('pendingSync: $pendingSync')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MateriasTable materias = $MateriasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [materias];
}

typedef $$MateriasTableCreateCompanionBuilder = MateriasCompanion Function({
  Value<int> id,
  required String nombre,
  required double notaMinima,
  required double notaMaxima,
  required DateTime updatedAt,
  Value<bool> pendingSync,
});
typedef $$MateriasTableUpdateCompanionBuilder = MateriasCompanion Function({
  Value<int> id,
  Value<String> nombre,
  Value<double> notaMinima,
  Value<double> notaMaxima,
  Value<DateTime> updatedAt,
  Value<bool> pendingSync,
});

class $$MateriasTableFilterComposer
    extends Composer<_$AppDatabase, $MateriasTable> {
  $$MateriasTableFilterComposer({
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

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get notaMinima => $composableBuilder(
    column: $table.notaMinima,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get notaMaxima => $composableBuilder(
    column: $table.notaMaxima,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MateriasTableOrderingComposer
    extends Composer<_$AppDatabase, $MateriasTable> {
  $$MateriasTableOrderingComposer({
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

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get notaMinima => $composableBuilder(
    column: $table.notaMinima,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get notaMaxima => $composableBuilder(
    column: $table.notaMaxima,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MateriasTableAnnotationComposer
    extends Composer<_$AppDatabase, $MateriasTable> {
  $$MateriasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<double> get notaMinima => $composableBuilder(
    column: $table.notaMinima,
    builder: (column) => column,
  );

  GeneratedColumn<double> get notaMaxima => $composableBuilder(
    column: $table.notaMaxima,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => column,
  );
}

class $$MateriasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MateriasTable,
          MateriaRow,
          $$MateriasTableFilterComposer,
          $$MateriasTableOrderingComposer,
          $$MateriasTableAnnotationComposer,
          $$MateriasTableCreateCompanionBuilder,
          $$MateriasTableUpdateCompanionBuilder,
          (
            MateriaRow,
            BaseReferences<_$AppDatabase, $MateriasTable, MateriaRow>,
          ),
          MateriaRow,
          PrefetchHooks Function()
        > {
  $$MateriasTableTableManager(_$AppDatabase db, $MateriasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MateriasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MateriasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MateriasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<double> notaMinima = const Value.absent(),
                Value<double> notaMaxima = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> pendingSync = const Value.absent(),
              }) => MateriasCompanion(
                id: id,
                nombre: nombre,
                notaMinima: notaMinima,
                notaMaxima: notaMaxima,
                updatedAt: updatedAt,
                pendingSync: pendingSync,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required double notaMinima,
                required double notaMaxima,
                required DateTime updatedAt,
                Value<bool> pendingSync = const Value.absent(),
              }) => MateriasCompanion.insert(
                id: id,
                nombre: nombre,
                notaMinima: notaMinima,
                notaMaxima: notaMaxima,
                updatedAt: updatedAt,
                pendingSync: pendingSync,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MateriasTable, MateriaRow>(table),
                  BaseReferences<_$AppDatabase, $MateriasTable, MateriaRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MateriasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MateriasTable,
      MateriaRow,
      $$MateriasTableFilterComposer,
      $$MateriasTableOrderingComposer,
      $$MateriasTableAnnotationComposer,
      $$MateriasTableCreateCompanionBuilder,
      $$MateriasTableUpdateCompanionBuilder,
      (MateriaRow, BaseReferences<_$AppDatabase, $MateriasTable, MateriaRow>),
      MateriaRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MateriasTableTableManager get materias =>
      $$MateriasTableTableManager(_db, _db.materias);
}
