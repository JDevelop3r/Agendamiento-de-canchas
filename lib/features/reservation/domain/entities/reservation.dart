import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

class ReservationEntity extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? id;

  DateTime date;

  String username;

  @ColumnInfo(name: "field_id")
  String fieldId;

  ReservationEntity(
      {this.id,
      required this.date,
      required this.username,
      required this.fieldId});

  @override
  List<Object?> get props => [id, date, username, fieldId];
}
