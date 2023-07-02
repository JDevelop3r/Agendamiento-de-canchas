import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'field', primaryKeys: ['id'])
class FieldModel extends FieldEntity {
  FieldModel({String? id}) : super(id: id);

  factory FieldModel.fromJson(Map<String, dynamic> map) {
    return FieldModel(
      id: map['id'] ?? '',
    );
  }

  factory FieldModel.fromEntity(FieldEntity field) {
    return FieldModel(
      id: field.id,
    );
  }
}
