import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/DAO/field_dao.dart';
import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/datetime_converter.dart';
import 'package:agendamiento_canchas/features/reservation/data/models/field.dart';
import 'package:agendamiento_canchas/features/reservation/data/models/reservation.dart';
import 'DAO/reservation_dao.dart';

part 'app_database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [FieldModel, ReservationModel])
abstract class AppDatabase extends FloorDatabase {
  FieldDao get fieldDao;

  ReservationDao get reservationDao;
}
