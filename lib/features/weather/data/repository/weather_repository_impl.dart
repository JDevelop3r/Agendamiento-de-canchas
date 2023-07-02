import 'dart:io';

import 'package:agendamiento_canchas/core/constants/constants.dart';
import 'package:agendamiento_canchas/core/resources/data_state.dart';
import 'package:agendamiento_canchas/features/weather/data/data_sources/remote/weather_api_service.dart';
import 'package:agendamiento_canchas/features/weather/domain/entities/weather_forecast.dart';
import 'package:agendamiento_canchas/features/weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _weatherApiService;

  WeatherRepositoryImpl(this._weatherApiService);

  @override
  Future<DataState<WeatherForecastEntity>> getWeather() async {
    try {
      final httpResponse = await _weatherApiService.getWeatherForecast(
          appid: weatherAPIKey, lat: fieldsLat, lon: fieldsLon);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          requestOptions: httpResponse.response.requestOptions,
          type: DioExceptionType.badResponse,
          response: httpResponse.response));
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
