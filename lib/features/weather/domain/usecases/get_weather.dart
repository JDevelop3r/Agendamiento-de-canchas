import 'package:agendamiento_canchas/core/resources/data_state.dart';
import 'package:agendamiento_canchas/core/usecases/usecase.dart';
import 'package:agendamiento_canchas/features/weather/domain/entities/weather_forecast.dart';
import 'package:agendamiento_canchas/features/weather/domain/repository/weather_repository.dart';

class GetWeatherUseCase
    implements UseCase<DataState<WeatherForecastEntity>, void> {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase(this._weatherRepository);

  @override
  Future<DataState<WeatherForecastEntity>> call({void params}) {
    return _weatherRepository.getWeather();
  }
}
