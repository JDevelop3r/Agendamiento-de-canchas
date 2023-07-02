import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/app_database.dart';
import 'package:agendamiento_canchas/features/reservation/data/models/field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/fields_repository.dart';

class FieldsRepositoryImpl implements FieldsRepository {
  final AppDatabase _appDatabase;

  FieldsRepositoryImpl(this._appDatabase);

  @override
  Future<List<FieldModel>> getFields() async {
    return _appDatabase.fieldDao.getFields();
  }

  @override
  Future<void> insertField(FieldEntity field) {
    return _appDatabase.fieldDao.insertField(FieldModel.fromEntity(field));
  }

  @override
  Future<void> removeField(FieldEntity field) {
    return _appDatabase.fieldDao.deleteField(FieldModel.fromEntity(field));
  }
}
