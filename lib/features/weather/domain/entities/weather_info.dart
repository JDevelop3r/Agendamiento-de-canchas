import 'package:equatable/equatable.dart';

class WeatherInfoEntity extends Equatable {
  double? pop;
  double? humidity;
  double? deg;

  WeatherInfoEntity({this.deg, this.humidity, this.pop});

  @override
  List<Object?> get props => [pop, humidity, deg];
}
