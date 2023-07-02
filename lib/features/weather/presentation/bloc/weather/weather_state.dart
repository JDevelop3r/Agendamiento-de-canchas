import 'package:agendamiento_canchas/features/weather/domain/entities/weather_forecast.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  final List<WeatherForecastEntity>? weather;
  final DioException? error;

  const WeatherState({this.weather, this.error});

  @override
  List<Object?> get props => [weather!, error!];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherDone extends WeatherState {
  const WeatherDone(List<WeatherForecastEntity> weather)
      : super(weather: weather);
}

class WeatherError extends WeatherState {
  const WeatherError(DioException error) : super(error: error);
}
