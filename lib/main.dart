import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/bloc.dart';
import 'package:weather_app/bloc/event.dart';
import 'package:weather_app/screen/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc()..add(WeatherRequest(cityName: "Lviv")),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherApp(),
      ),
    );
  }
}
