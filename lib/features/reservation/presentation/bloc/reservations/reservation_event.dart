import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:equatable/equatable.dart';

abstract class ReservationsEvent extends Equatable {
  final ReservationEntity? reservation;

  const ReservationsEvent({this.reservation});

  @override
  List<Object?> get props => [reservation!];
}

class GetSavedReservations extends ReservationsEvent {
  const GetSavedReservations();
}

class RemoveReservation extends ReservationsEvent {
  const RemoveReservation(ReservationEntity reservation)
      : super(reservation: reservation);
}

class InsertReservation extends ReservationsEvent {
  const InsertReservation(ReservationEntity reservation)
      : super(reservation: reservation);
}
