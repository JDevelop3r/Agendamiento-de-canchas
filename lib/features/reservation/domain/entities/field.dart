import 'package:equatable/equatable.dart';

class FieldEntity extends Equatable {
  String? id;

  FieldEntity({this.id});

  @override
  List<Object?> get props => [id];
}
