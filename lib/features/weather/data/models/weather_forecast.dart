import 'package:agendamiento_canchas/features/weather/domain/entities/weather_forecast.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  WeatherForecastModel({required DateTime date, int? precipitation})
      : super(date: date, precipitation: precipitation);

  factory WeatherForecastModel.fromJson(Map<String, dynamic> map) {
    final daily = map['daily'];

    return WeatherForecastModel(date: DateTime.now());
  }
}
