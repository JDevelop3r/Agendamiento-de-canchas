import 'package:agendamiento_canchas/core/resources/data_state.dart';
import 'package:agendamiento_canchas/features/weather/domain/entities/weather_forecast.dart';

abstract class WeatherRepository {
  Future<DataState<List<WeatherForecastEntity>>> getWeather();
}
