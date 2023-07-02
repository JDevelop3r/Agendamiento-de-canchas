import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/reservations_repository.dart';

class InsertReservationUseCase implements UseCase<void, ReservationEntity> {
  final ReservationsRepository _reservationRepository;

  InsertReservationUseCase(this._reservationRepository);

  @override
  Future<void> call({ReservationEntity? params}) {
    return _reservationRepository.insertReservation(params!);
  }
}
