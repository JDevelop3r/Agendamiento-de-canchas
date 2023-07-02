import 'package:agendamiento_canchas/features/reservation/data/models/reservation.dart';
import 'package:floor/floor.dart';

@dao
abstract class ReservationDao {
  @Insert()
  Future<void> insertReservation(ReservationModel reservation);

  @Query('DELETE FROM reservation WHERE id = :id')
  Future<void> deleteReservation(int id);

  @Query('SELECT * FROM reservation WHERE date = :date')
  Future<List<ReservationModel>> getReservationsByDate(DateTime date);

  @Query('SELECT * FROM reservation order by date')
  Future<List<ReservationModel>> getReservations();
}
