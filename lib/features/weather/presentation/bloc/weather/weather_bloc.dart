import 'package:agendamiento_canchas/core/resources/data_state.dart';
import 'package:agendamiento_canchas/features/weather/domain/usecases/get_weather.dart';
import 'package:agendamiento_canchas/features/weather/presentation/bloc/weather/weather_event.dart';
import 'package:agendamiento_canchas/features/weather/presentation/bloc/weather/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase _getWeatherUseCase;

  WeatherBloc(this._getWeatherUseCase) : super(const WeatherLoading()) {
    on<GetWeather>(onGetWeather);
  }

  void onGetWeather(GetWeather event, Emitter<WeatherState> emitter) async {
    final dataState = await _getWeatherUseCase.call();

    if (dataState is DataSuccess && dataState.data != null) {
      emitter(WeatherDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emitter(WeatherError(dataState.error!));
    }
  }
}
