import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_bloc.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_event.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_state.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/widgets/reservation_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationListPage extends StatelessWidget {
  static String route = '/';
  const ReservationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
        title: const Text(
      'Reservación de Canchas',
      style: TextStyle(color: Colors.black, fontSize: 18),
    ));
  }

  _buildBody() {
    return BlocBuilder<ReservationsBloc, ReservationsState>(
      builder: (_, state) {
        if (state is ReservationsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is ReservationsDone) {
          if (state.reservations!.isEmpty) {
            return const Center(
              child: Text('No hay reservaciones en este momento.',
                  style: TextStyle(fontStyle: FontStyle.italic)),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ReservationTile(
                  reservation: state.reservations![index],
                  onRemove: _onRemoveReservation(context),
                ),
              );
            },
            itemCount: state.reservations!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed('/addReservation'),
      child: const Icon(Icons.add),
    );
  }

  _onRemoveReservation(BuildContext context) {
    return (ReservationEntity reservation) {
      BlocProvider.of<ReservationsBloc>(context)
          .add(RemoveReservation(reservation));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black,
          content: Text('Reservacion eliminada.'),
        ),
      );
    };
  }
}
