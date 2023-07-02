import 'package:agendamiento_canchas/features/reservation/domain/usecases/reservations/get_reservations.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/reservations/insert_reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/reservations/remove_reservation.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_event.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  final GetReservationsUseCase _getReservationsUseCase;
  final InsertReservationUseCase _insertReservationUseCase;
  final RemoveReservationUseCase _removeReservationUseCase;

  ReservationsBloc(this._getReservationsUseCase, this._insertReservationUseCase,
      this._removeReservationUseCase)
      : super(const ReservationsLoading()) {
    on<GetSavedReservations>(onGetReservations);
    on<RemoveReservation>(onRemoveReservation);
    on<InsertReservation>(onInsertReservation);
  }

  void onGetReservations(
      GetSavedReservations event, Emitter<ReservationsState> emitter) async {
    final reservations = await _getReservationsUseCase();

    emitter(ReservationsDone(reservations));
  }

  void onInsertReservation(InsertReservation insertReservation,
      Emitter<ReservationsState> emitter) async {
    await _insertReservationUseCase(params: insertReservation.reservation);
    final reservations = await _getReservationsUseCase();

    emitter(ReservationsDone(reservations));
  }

  void onRemoveReservation(RemoveReservation removeReservation,
      Emitter<ReservationsState> emitter) async {
    await _removeReservationUseCase(params: removeReservation.reservation);
    final reservations = await _getReservationsUseCase();

    emitter(ReservationsDone(reservations));
  }
}
