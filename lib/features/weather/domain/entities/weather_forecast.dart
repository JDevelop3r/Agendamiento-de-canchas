import 'package:agendamiento_canchas/features/weather/data/models/city.dart';
import 'package:agendamiento_canchas/features/weather/domain/entities/weather_info.dart';
import 'package:equatable/equatable.dart';

class WeatherForecastEntity extends Equatable {
  CityModel? city;

  List<WeatherInfoEntity>? list;

  WeatherForecastEntity({this.city, this.list});

  @override
  List<Object?> get props => [city, list];
}
