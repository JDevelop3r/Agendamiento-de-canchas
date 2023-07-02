import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/DAO/field_dao.dart';
import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/app_database.dart';
import 'package:agendamiento_canchas/features/reservation/data/models/field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock implements $FloorAppDatabase {}

void main() {
  group('field dao tests', () {
    late AppDatabase database;
    late FieldDao fieldDao;

    FieldModel fieldA = FieldModel(id: 'A');
    FieldModel fieldB = FieldModel(id: 'B');
    FieldModel fieldC = FieldModel(id: 'C');

    setUp(() async {
      database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
      fieldDao = database.fieldDao;
    });
    test('get fields, expect 0', () async {
      final fields = await fieldDao.getFields();

      // expect 0 field
      expect(0, fields.length);
    });

    test('insert fields, expect 3', () async {
      await fieldDao.insertField(fieldA);
      await fieldDao.insertField(fieldB);
      await fieldDao.insertField(fieldC);

      final fields = await fieldDao.getFields();

      // expect 3 field
      expect(3, fields.length);
    });

    test('delete field, expect 2', () async {
      await fieldDao.deleteField(fieldC);

      final fields = await fieldDao.getFields();

      // expect 3 field
      expect(2, fields.length);
    });

    test('insert fields, throws error, id already exist', () async {
      // Throws a DatabaseException
      expect(() async => await fieldDao.insertField(fieldA),
          throwsA(isA<DatabaseException>()));
    });
  });
}
