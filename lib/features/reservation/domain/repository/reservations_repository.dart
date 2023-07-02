import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';

abstract class ReservationsRepository {
  Future<List<ReservationEntity>> getReservations();
  Future<List<ReservationEntity>> getReservationsByDate(DateTime date);

  Future<void> insertReservation(ReservationEntity reservation);

  Future<void> removeReservation(ReservationEntity reservation);
}
