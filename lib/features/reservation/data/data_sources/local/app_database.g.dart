// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FieldDao? _fieldDaoInstance;

  ReservationDao? _reservationDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `field` (`id` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `reservation` (`id` INTEGER, `date` INTEGER NOT NULL, `username` TEXT NOT NULL, `field_id` TEXT NOT NULL, FOREIGN KEY (`field_id`) REFERENCES `field` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FieldDao get fieldDao {
    return _fieldDaoInstance ??= _$FieldDao(database, changeListener);
  }

  @override
  ReservationDao get reservationDao {
    return _reservationDaoInstance ??=
        _$ReservationDao(database, changeListener);
  }
}

class _$FieldDao extends FieldDao {
  _$FieldDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _fieldModelInsertionAdapter = InsertionAdapter(database, 'field',
            (FieldModel item) => <String, Object?>{'id': item.id}),
        _fieldModelDeletionAdapter = DeletionAdapter(database, 'field', ['id'],
            (FieldModel item) => <String, Object?>{'id': item.id});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FieldModel> _fieldModelInsertionAdapter;

  final DeletionAdapter<FieldModel> _fieldModelDeletionAdapter;

  @override
  Future<List<FieldModel>> getFields() async {
    return _queryAdapter.queryList('SELECT * FROM field',
        mapper: (Map<String, Object?> row) =>
            FieldModel(id: row['id'] as String?));
  }

  @override
  Future<void> insertField(FieldModel field) async {
    await _fieldModelInsertionAdapter.insert(field, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteField(FieldModel field) async {
    await _fieldModelDeletionAdapter.delete(field);
  }
}

class _$ReservationDao extends ReservationDao {
  _$ReservationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _reservationModelInsertionAdapter = InsertionAdapter(
            database,
            'reservation',
            (ReservationModel item) => <String, Object?>{
                  'id': item.id,
                  'date': _dateTimeConverter.encode(item.date),
                  'username': item.username,
                  'field_id': item.fieldId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ReservationModel> _reservationModelInsertionAdapter;

  @override
  Future<void> deleteReservation(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM reservation WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<List<ReservationModel>> getReservationsByDate(DateTime date) async {
    return _queryAdapter.queryList('SELECT * FROM reservation WHERE date = ?1',
        mapper: (Map<String, Object?> row) => ReservationModel(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            username: row['username'] as String,
            fieldId: row['field_id'] as String),
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Future<List<ReservationModel>> getReservations() async {
    return _queryAdapter.queryList('SELECT * FROM reservation order by date',
        mapper: (Map<String, Object?> row) => ReservationModel(
            id: row['id'] as int?,
            date: _dateTimeConverter.decode(row['date'] as int),
            username: row['username'] as String,
            fieldId: row['field_id'] as String));
  }

  @override
  Future<void> insertReservation(ReservationModel reservation) async {
    await _reservationModelInsertionAdapter.insert(
        reservation, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
