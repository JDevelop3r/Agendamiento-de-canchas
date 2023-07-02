import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/DAO/reservation_dao.dart';
import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/app_database.dart';
import 'package:agendamiento_canchas/features/reservation/data/models/field.dart';
import 'package:agendamiento_canchas/features/reservation/data/models/reservation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDatabase extends Mock implements $FloorAppDatabase {}

void main() {
  group('reservation dao tests', () {
    late AppDatabase database;
    late ReservationDao reservationDao;
    FieldModel fieldA = FieldModel(id: 'A');

    ReservationModel reservation1 = ReservationModel(
        date: DateTime(2023, 7, 2), username: 'Test', fieldId: 'A');
    ReservationModel reservation2 = ReservationModel(
        date: DateTime(2023, 7, 2), username: 'Test', fieldId: 'A');

    setUp(() async {
      database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
      reservationDao = database.reservationDao;
    });
    test('get reservations, expect 0', () async {
      final reservations = await reservationDao.getReservations();

      // expect 1 reservation
      expect(0, reservations.length);
    });

    test('insert reservation, check id', () async {
      await database.fieldDao.insertField(fieldA);
      final id = await reservationDao.insertReservation(reservation1);

      reservation1.id = id;
      final reservations = await reservationDao.getReservations();

      // expect 1 reservation
      expect(reservations.first.id, id);
    });

    test('insert reservation, id auto-increment', () async {
      final id = await reservationDao.insertReservation(reservation2);

      reservation2.id = id;
      // expect 2 reservation
      expect(reservation1.id! + 1, id);
    });

    test('get reservations by date', () async {
      final reservations =
          await reservationDao.getReservationsByDate(DateTime(2023, 7, 2));

      // expect 2 reservation
      expect(reservations.length, 2);
    });

    test('delete reservation', () async {
      await reservationDao.deleteReservation(1);
      final reservations = await reservationDao.getReservations();
      // expect 2 reservation
      expect(reservations.length, 1);
    });
  });
}
