import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:equatable/equatable.dart';

abstract class ReservationsState extends Equatable {
  final List<ReservationEntity>? reservations;

  const ReservationsState({this.reservations});

  @override
  List<Object?> get props => [reservations];
}

class ReservationsLoading extends ReservationsState {
  const ReservationsLoading();
}

class ReservationsDone extends ReservationsState {
  const ReservationsDone(List<ReservationEntity> reservations)
      : super(reservations: reservations);
}
