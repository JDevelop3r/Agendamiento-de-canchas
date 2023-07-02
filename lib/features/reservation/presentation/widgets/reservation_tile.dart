import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/widgets/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationTile extends StatelessWidget {
  final ReservationEntity reservation;
  final void Function(ReservationEntity) onRemove;
  final format = DateFormat.yMd('es');

  ReservationTile(
      {super.key, required this.reservation, required this.onRemove});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor),
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, bottom: 7, top: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitleAndDescription(),
          _buildRemovableArea(context),
        ],
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cancha: ${reservation.fieldId}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text(
                  format.format(reservation.date),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Agendado por: ${reservation.username}',
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea(BuildContext context) {
    return GestureDetector(
      onTap: () => _onRemove(context),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(Icons.remove_circle_outline, color: Colors.red),
      ),
    );
  }

  void _onRemove(BuildContext context) async {
    final confirm = await showAlertDialog(context,
        message: '¿Deseas eliminar esta reservación?',
        title: 'Eliminar Reservación');
    if (confirm == true) {
      onRemove(reservation);
    }
  }
}
