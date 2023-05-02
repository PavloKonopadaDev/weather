import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/repository/data_providers/weather,_data.dart';
import 'package:weather_app/repository/model/model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider = WeatherDataProvider();

  Future<Weather> getWeather(String location) async {
    final http.Response rawWeather =
        await weatherDataProvider.getRawWeatherData(location);
    final json = await jsonDecode(rawWeather.body);
    final Weather weather = Weather.fromJson(json);
    return weather;
  }
}
