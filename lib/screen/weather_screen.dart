import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/bloc.dart';
import 'package:weather_app/bloc/event.dart';
import 'package:weather_app/bloc/state.dart';
import 'package:weather_app/screen/error_page.dart';
import 'package:weather_app/utils/dimens.dart';
import 'package:weather_app/utils/strings.dart';

class WeatherApp extends StatelessWidget {
  final _cityController = TextEditingController();

  WeatherApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(titleText),
        centerTitle: true,
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadInprogress) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(loadingText)),
            );
          }
        },
        builder: (context, state) {
          if (state is WeatherLoadInprogress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoadFailure) {
            Future.delayed(const Duration(seconds: 5), () {
              context.read<WeatherBloc>().add(WeatherRequest(cityName: "Lviv"),
            );
            });
            return Cat404Page();
          } else if (state is WeatherLoadSuccess) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: ThemeDimens.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      hintText: hintText,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: ThemeDimens.spaceHuge),
                      Text(state.weather.name, style:
                        Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: ThemeDimens.spaceSmall),
                      if (state.weather.main["temp"] < ThemeDimens.temp)
                        const Icon(Icons.cloud),
                      if (state.weather.main["temp"] > ThemeDimens.temp)
                        const Icon(Icons.sunny),
                      Text("${state.weather.main["temp"]}°",style:
                       Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_cityController.text.isNotEmpty) {
                        context.read<WeatherBloc>().add(
                          WeatherRequest(cityName: _cityController.text),
                            );
                      }
                    },
                    child: const Text(buttonText),
                  )
                ],
              ),
            );
          } else {
            return Text("state: $state");
          }
        },
      ),
    );
  }
}
