import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';

import '../../repository/fields_repository.dart';

class RemoveFieldUseCase implements UseCase<void, FieldEntity> {
  final FieldsRepository _fieldsRepository;

  RemoveFieldUseCase(this._fieldsRepository);

  @override
  Future<void> call({FieldEntity? params}) {
    return _fieldsRepository.removeField(params!);
  }
}
