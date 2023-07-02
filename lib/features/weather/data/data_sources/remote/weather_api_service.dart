import 'package:agendamiento_canchas/core/constants/constants.dart';
import 'package:agendamiento_canchas/features/weather/data/models/weather_forecast.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: weatherAPIUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) = _WeatherApiService;

  @GET('/endpoint')
  Future<HttpResponse<WeatherForecastModel>> getWeatherForecast(
      {@Query('appid') String? appid,
      @Query('lat') double? lat,
      @Query('lon') double? lon,
      @Query('cnt') int cnt = 16,
      @Query('units') String units = 'metric'});
}
