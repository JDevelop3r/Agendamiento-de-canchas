import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/fields_repository.dart';

class InsertFieldUseCase implements UseCase<void, FieldEntity> {
  final FieldsRepository _fieldsRepository;

  InsertFieldUseCase(this._fieldsRepository);

  @override
  Future<void> call({FieldEntity? params}) {
    return _fieldsRepository.insertField(params!);
  }
}
