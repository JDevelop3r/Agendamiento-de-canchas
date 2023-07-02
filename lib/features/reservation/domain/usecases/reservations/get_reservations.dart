import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/reservations_repository.dart';

class GetReservationsUseCase implements UseCase<List<ReservationEntity>, void> {
  final ReservationsRepository _reservationRepository;

  GetReservationsUseCase(this._reservationRepository);

  @override
  Future<List<ReservationEntity>> call({void params}) {
    return _reservationRepository.getReservations();
  }
}
