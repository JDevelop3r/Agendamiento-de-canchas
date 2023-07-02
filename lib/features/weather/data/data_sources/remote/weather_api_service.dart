import 'package:agendamiento_canchas/core/constants/constants.dart';
import 'package:agendamiento_canchas/features/weather/data/models/weather_forecast.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: weatherAPIUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) = _WeatherApiService;

  @GET('/v1/forecast')
  Future<HttpResponse<List<WeatherForecastModel>>> getWeatherForecast({
    @Query('latitude') double? lat,
    @Query('longitude') double? lon,
    @Query('daily') String daily = 'precipitation_probability_max',
    @Query('timezone') String timezone = 'auto',
    @Query('forecast_days') int cnt = 16,
  });
}
