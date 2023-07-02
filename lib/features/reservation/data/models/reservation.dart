import 'package:agendamiento_canchas/features/reservation/data/models/field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'reservation', primaryKeys: [
  'id'
], foreignKeys: [
  ForeignKey(
    childColumns: ['field_id'],
    parentColumns: ['id'],
    entity: FieldModel,
  )
])
class ReservationModel extends ReservationEntity {
  ReservationModel(
      {int? id,
      required DateTime date,
      required String username,
      required String fieldId})
      : super(id: id, date: date, username: username, fieldId: fieldId);

  factory ReservationModel.fromJson(Map<String, dynamic> map) {
    return ReservationModel(
        id: map['id'],
        date: map['date'],
        username: map['username'] ?? '',
        fieldId: map['field_id']);
  }

  factory ReservationModel.fromEntity(ReservationEntity entity) {
    return ReservationModel(
        date: entity.date, username: entity.username, fieldId: entity.fieldId);
  }
}
