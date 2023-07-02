import 'package:agendamiento_canchas/features/weather/data/models/coord.dart';
import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  String? name;
  String? country;
  CoordModel? coord;

  CityEntity({this.coord, this.country, this.name});

  @override
  List<Object?> get props => [name, country, coord];
}
