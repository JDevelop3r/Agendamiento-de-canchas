import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';
import 'package:equatable/equatable.dart';

abstract class FieldsState extends Equatable {
  final List<FieldEntity>? fields;

  const FieldsState({this.fields});

  @override
  List<Object?> get props => [fields];
}

class FieldsLoading extends FieldsState {
  const FieldsLoading();
}

class FieldsDone extends FieldsState {
  const FieldsDone(List<FieldEntity> fields) : super(fields: fields);
}
