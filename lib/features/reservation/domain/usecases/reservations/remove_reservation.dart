import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/reservations_repository.dart';

class RemoveReservationUseCase implements UseCase<void, ReservationEntity> {
  final ReservationsRepository _reservationRepository;

  RemoveReservationUseCase(this._reservationRepository);

  @override
  Future<void> call({ReservationEntity? params}) {
    return _reservationRepository.removeReservation(params!);
  }
}
