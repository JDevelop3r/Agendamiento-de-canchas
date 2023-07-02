// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WeatherApiService implements WeatherApiService {
  _WeatherApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.open-meteo.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<WeatherForecastModel>>> getWeatherForecast({
    lat,
    lon,
    daily = 'precipitation_probability_max',
    timezone = 'auto',
    cnt = 16,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'latitude': lat,
      r'longitude': lon,
      r'daily': daily,
      r'timezone': timezone,
      r'forecast_days': cnt,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<WeatherForecastModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/forecast',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) =>
            WeatherForecastModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
