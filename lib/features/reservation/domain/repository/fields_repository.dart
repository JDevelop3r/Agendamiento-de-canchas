import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';

abstract class FieldsRepository {
  Future<List<FieldEntity>> getFields();

  Future<void> insertField(FieldEntity reservation);

  Future<void> removeField(FieldEntity reservation);
}
