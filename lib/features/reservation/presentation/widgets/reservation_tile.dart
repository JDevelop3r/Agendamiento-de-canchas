import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/widgets/confirm_dialog.dart';
import 'package:agendamiento_canchas/features/weather/domain/entities/weather_forecast.dart';
import 'package:agendamiento_canchas/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:agendamiento_canchas/features/weather/presentation/bloc/weather/weather_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReservationTile extends StatelessWidget {
  final ReservationEntity reservation;
  final void Function(ReservationEntity) onRemove;
  final format = DateFormat.yMd('es');

  ReservationTile(
      {super.key, required this.reservation, required this.onRemove});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (_, state) {
      if (state is WeatherLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }

      // print(state.weather);

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
            _buildTimePrecipitationForecast(state.weather!
                .firstWhere((element) => element.date == reservation.date)),
            _buildRemovableArea(context),
          ],
        ),
      );
    });
  }

  Widget _buildTimePrecipitationForecast(WeatherForecastEntity weather) {
    // print(weather);
    return Center(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(children: [
        if (weather.precipitation == null) const Text('No data'),
        if (weather.precipitation != null) ...[
          Text('${weather.precipitation}%'),
          if (weather.precipitation! < 25) const Icon(Icons.wb_sunny_rounded),
          if (weather.precipitation! >= 25 && weather.precipitation! < 50)
            const Icon(Icons.sunny_snowing),
          if (weather.precipitation! >= 50) const Icon(Icons.cloudy_snowing),
        ]
      ]),
    ));
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
