import 'package:agendamiento_canchas/features/reservation/data/models/field.dart';
import 'package:floor/floor.dart';

@dao
abstract class FieldDao {
  @Insert()
  Future<void> insertField(FieldModel field);

  @delete
  Future<void> deleteField(FieldModel field);

  @Query('SELECT * FROM field')
  Future<List<FieldModel>> getFields();
}
