import 'package:agendamiento_canchas/features/weather/data/models/coord.dart';
import 'package:agendamiento_canchas/features/weather/domain/entities/city.dart';

class CityModel extends CityEntity {
  CityModel({CoordModel? coord, String? country, String? name});

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
        coord: CoordModel.fromJson(map['coord']),
        country: map['country'],
        name: map['name']);
  }
}
