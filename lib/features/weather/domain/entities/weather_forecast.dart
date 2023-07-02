import 'package:equatable/equatable.dart';

class WeatherForecastEntity extends Equatable {
  DateTime date;
  int? precipitation;

  WeatherForecastEntity({required this.date, this.precipitation});

  @override
  List<Object?> get props => [date, precipitation];
}
