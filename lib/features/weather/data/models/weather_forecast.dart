import 'package:agendamiento_canchas/features/weather/data/models/city.dart';
import 'package:agendamiento_canchas/features/weather/data/models/weather_info.dart';
import 'package:agendamiento_canchas/features/weather/domain/entities/weather_forecast.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  WeatherForecastModel({CityModel? city, List<WeatherInfoModel>? list});

  factory WeatherForecastModel.fromJson(Map<String, dynamic> map) {
    final list = map['list'].map((el) => WeatherInfoModel.fromJson(el));

    return WeatherForecastModel(
        city: CityModel.fromJson(map['city']), list: list);
  }
}
