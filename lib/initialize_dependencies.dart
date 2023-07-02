import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/app_database.dart';
import 'package:agendamiento_canchas/features/reservation/data/repository/fields_repository_impl.dart';
import 'package:agendamiento_canchas/features/reservation/data/repository/reservations_repository_impl.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/fields_repository.dart';
import 'package:agendamiento_canchas/features/reservation/domain/repository/reservations_repository.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/fields/get_fields.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/fields/insert_field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/fields/remove_field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/reservations/get_reservations.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/reservations/get_reservatios_by_date.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/reservations/insert_reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/reservations/remove_reservation.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/fields/field_bloc.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_bloc.dart';
import 'package:agendamiento_canchas/features/weather/domain/usecases/get_weather.dart';
import 'package:agendamiento_canchas/features/weather/data/data_sources/remote/weather_api_service.dart';
import 'package:agendamiento_canchas/features/weather/data/repository/weather_repository_impl.dart';
import 'package:agendamiento_canchas/features/weather/domain/repository/weather_repository.dart';
import 'package:agendamiento_canchas/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initalizeDependencies() async {
  //Database
  final database = await $FloorAppDatabase
      .databaseBuilder('agendamiento_canchas.db')
      .build();
  sl.registerSingleton(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Api Services
  sl.registerSingleton<WeatherApiService>(WeatherApiService(sl()));

  // Repositories
  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(sl()));
  sl.registerSingleton<ReservationsRepository>(
      ReservationsRepositoryImpl(sl()));
  sl.registerSingleton<FieldsRepository>(FieldsRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase(sl()));

  sl.registerSingleton<GetReservationsUseCase>(GetReservationsUseCase(sl()));
  sl.registerSingleton<GetReservationsByDateUseCase>(
      GetReservationsByDateUseCase(sl()));
  sl.registerSingleton<InsertReservationUseCase>(
      InsertReservationUseCase(sl()));
  sl.registerSingleton<RemoveReservationUseCase>(
      RemoveReservationUseCase(sl()));

  sl.registerSingleton<GetFieldsUseCase>(GetFieldsUseCase(sl()));
  sl.registerSingleton<InsertFieldUseCase>(InsertFieldUseCase(sl()));
  sl.registerSingleton<RemoveFieldUseCase>(RemoveFieldUseCase(sl()));

  // Blocs
  sl.registerFactory<WeatherBloc>(() => WeatherBloc(sl()));
  sl.registerFactory<ReservationsBloc>(
      () => ReservationsBloc(sl(), sl(), sl()));
  sl.registerFactory<FieldsBloc>(() => FieldsBloc(sl(), sl(), sl()));
}
