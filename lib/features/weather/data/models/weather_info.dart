import 'package:agendamiento_canchas/features/weather/domain/entities/weather_info.dart';

class WeatherInfoModel extends WeatherInfoEntity {
  WeatherInfoModel({double? deg, double? humidity, double? pop});

  factory WeatherInfoModel.fromJson(Map<String, dynamic> map) {
    return WeatherInfoModel(
        deg: map['deg'], humidity: map['humidity'], pop: map['pop']);
  }
}
