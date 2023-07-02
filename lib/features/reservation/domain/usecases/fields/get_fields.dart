import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/fields_repository.dart';

class GetFieldsUseCase implements UseCase<List<FieldEntity>, void> {
  final FieldsRepository _fieldsRepository;

  GetFieldsUseCase(this._fieldsRepository);

  @override
  Future<List<FieldEntity>> call({void params}) {
    return _fieldsRepository.getFields();
  }
}
