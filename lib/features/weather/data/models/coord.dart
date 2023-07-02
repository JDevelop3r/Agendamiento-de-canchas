import 'package:agendamiento_canchas/features/weather/domain/entities/coord.dart';

class CoordModel extends CoordEntity {
  CoordModel({double? latitude, double? longitude});

  factory CoordModel.fromJson(Map<String, dynamic> map) {
    return CoordModel(latitude: map['lat'], longitude: map['lon']);
  }
}
