import 'package:agendamiento_canchas/core/resources/data_state.dart';
import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/weather/domain/entities/weather_forecast.dart';
import 'package:agendamiento_canchas/features/weather/domain/repository/weather_repository.dart';

class GetWeatherUseCase
    implements UseCase<DataState<List<WeatherForecastEntity>>, void> {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  @override
  Future<DataState<List<WeatherForecastEntity>>> call({void params}) {
    print('GetWeatherUseCase');
    return _weatherRepository.getWeather();
  }
}
