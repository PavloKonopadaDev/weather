import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather_app/bloc/event.dart';
import 'package:weather_app/bloc/state.dart';
import 'package:weather_app/repository/repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository = WeatherRepository();
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequest) {
      yield WeatherLoadInprogress();

      try {
        final weatherResponse =
            await _weatherRepository.getWeather(event.cityName);
        yield WeatherLoadSuccess(weather: weatherResponse);
      } catch (e) {
        yield WeatherLoadFailure(error: e.toString());
      }
    }
  }
}
