import 'package:agendamiento_canchas/features/reservation/presentation/pages/add_new_reservation/add_new_reservation.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/pages/reservation_list/reservation_list.dart';

final routes = {
  '/': (_) => const ReservationListPage(),
  '/addReservation': (_) => AddNewReservationPage(),
};
