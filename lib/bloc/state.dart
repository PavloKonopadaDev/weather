import 'package:weather_app/repository/model/model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadInprogress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;

  WeatherLoadSuccess({required this.weather});
}

class WeatherLoadFailure extends WeatherState {
  final String error;

  WeatherLoadFailure({required this.error});
}
