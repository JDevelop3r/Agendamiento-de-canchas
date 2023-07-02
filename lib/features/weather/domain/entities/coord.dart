import 'package:equatable/equatable.dart';

class CoordEntity extends Equatable {
  double? longitude;
  double? latitude;

  CoordEntity({this.latitude, this.longitude});

  @override
  List<Object?> get props => [longitude, latitude];
}
