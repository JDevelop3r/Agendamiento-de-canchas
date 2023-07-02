import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';
import 'package:equatable/equatable.dart';

abstract class FieldsEvent extends Equatable {
  final FieldEntity? field;

  const FieldsEvent({this.field});

  @override
  List<Object?> get props => [field!];
}

class GetSavedFields extends FieldsEvent {
  const GetSavedFields();
}

class RemoveField extends FieldsEvent {
  const RemoveField(FieldEntity field) : super(field: field);
}

class InsertField extends FieldsEvent {
  const InsertField(FieldEntity field) : super(field: field);
}
