import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/app_database.dart';
import 'package:agendamiento_canchas/features/reservation/data/models/field.dart';

databaseInitialization(AppDatabase appDatabase) async {
  final fieldDao = appDatabase.fieldDao;

  final fields = await fieldDao.getFields();
  if (fields.isNotEmpty) return;

  final fieldA = FieldModel(id: 'A');
  final fieldB = FieldModel(id: 'B');
  final fieldC = FieldModel(id: 'C');

  await fieldDao.insertField(fieldA);
  await fieldDao.insertField(fieldB);
  await fieldDao.insertField(fieldC);
}
