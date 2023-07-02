import 'dart:math';

import 'package:agendamiento_canchas/features/reservation/data/data_sources/local/app_database.dart';
import 'package:agendamiento_canchas/features/weather/data/data_sources/remote/weather_api_service.dart';
import 'package:agendamiento_canchas/features/weather/data/models/weather_forecast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:retrofit/retrofit.dart';

import 'weather_api_service_test.mocks.dart';

class MockDatabase extends Mock implements $FloorAppDatabase {}

@GenerateMocks([WeatherApiService])
void main() {
  group('Weather API Service Tests', () {
    late WeatherApiService weatherService;

    setUp(() {
      weatherService = MockWeatherApiService();
    });

    test('Fetch weather api', () async {
      final randomList = [
        for (var i = 1; i < 16; i++)
          WeatherForecastModel(
              date: DateTime.parse(
                '2023-07-${i < 10 ? '0$i' : i}',
              ),
              precipitation: Random().nextInt(100))
      ];

      HttpResponse<List<WeatherForecastModel>> randomResponse = HttpResponse(
          randomList,
          Response(
            data: randomList,
            requestOptions: RequestOptions(),
          ));

      when(weatherService.getWeatherForecast()).thenAnswer(// #2
          (realInvocation) async => randomResponse);

      final expected = randomResponse;

      expect(await weatherService.getWeatherForecast(), expected);
    });
  });
}
