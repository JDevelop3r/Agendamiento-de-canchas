import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/reservations_repository.dart';

class GetReservationsByDateUseCase
    implements UseCase<List<ReservationEntity>, DateTime> {
  final ReservationsRepository _reservationRepository;

  GetReservationsByDateUseCase(this._reservationRepository);

  @override
  Future<List<ReservationEntity>> call({DateTime? params}) {
    return _reservationRepository.getReservationsByDate(params!);
  }
}
