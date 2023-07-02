import 'package:agendamiento_canchas/config/database/database_initialization.dart';
import 'package:agendamiento_canchas/config/routes/routes.dart';
import 'package:agendamiento_canchas/config/theme/app_themes.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_bloc.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_event.dart';
import 'package:agendamiento_canchas/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:agendamiento_canchas/features/weather/presentation/bloc/weather/weather_event.dart';
import 'package:agendamiento_canchas/initialize_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependencies
  await initializeDateFormatting();
  await initalizeDependencies();
  await databaseInitialization(sl());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
              create: (context) => sl<WeatherBloc>()..add(const GetWeather())),
          BlocProvider<ReservationsBloc>(
              create: (context) => sl()..add(const GetSavedReservations()))
        ],
        child: MaterialApp(
          theme: theme(),
          initialRoute: '/',
          routes: routes,
        ));
  }
}
