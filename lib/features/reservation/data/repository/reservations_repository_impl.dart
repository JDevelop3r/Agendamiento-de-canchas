import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/app_database.dart';
import 'package:agendamiento_canchas/features/reservation/data/models/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/reservations_repository.dart';

class ReservationsRepositoryImpl implements ReservationsRepository {
  final AppDatabase _appDatabase;

  ReservationsRepositoryImpl(this._appDatabase);

  @override
  Future<List<ReservationModel>> getReservations() async {
    return _appDatabase.reservationDao.getReservations();
  }

  @override
  Future<List<ReservationModel>> getReservationsByDate(DateTime date) async {
    return _appDatabase.reservationDao.getReservationsByDate(date);
  }

  @override
  Future<void> insertReservation(ReservationEntity reservation) {
    return _appDatabase.reservationDao
        .insertReservation(ReservationModel.fromEntity(reservation));
  }

  @override
  Future<void> removeReservation(ReservationEntity reservation) {
    return _appDatabase.reservationDao.deleteReservation(reservation.id!);
  }
}
