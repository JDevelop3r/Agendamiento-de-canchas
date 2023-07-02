import 'package:agendamiento_canchas/features/reservation/domain/usecases/fields/get_fields.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/fields/insert_field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/fields/remove_field.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/fields/field_event.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/fields/field_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldsBloc extends Bloc<FieldsEvent, FieldsState> {
  final GetFieldsUseCase _getFieldsUseCase;
  final InsertFieldUseCase _insertFieldUseCase;
  final RemoveFieldUseCase _removeFieldUseCase;

  FieldsBloc(this._getFieldsUseCase, this._insertFieldUseCase,
      this._removeFieldUseCase)
      : super(const FieldsLoading()) {
    on<GetSavedFields>(onGetFields);
    on<RemoveField>(onRemoveField);
    on<InsertField>(onInsertField);
  }

  void onGetFields(GetSavedFields event, Emitter<FieldsState> emitter) async {
    final fields = await _getFieldsUseCase();

    emitter(FieldsDone(fields));
  }

  void onInsertField(
      InsertField insertField, Emitter<FieldsState> emitter) async {
    await _insertFieldUseCase(params: insertField.field);
    final fields = await _getFieldsUseCase();

    emitter(FieldsDone(fields));
  }

  void onRemoveField(
      RemoveField removeField, Emitter<FieldsState> emitter) async {
    await _removeFieldUseCase(params: removeField.field);
    final Fields = await _getFieldsUseCase();

    emitter(FieldsDone(Fields));
  }
}
