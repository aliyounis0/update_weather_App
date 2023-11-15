import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/loading_body.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Forecast',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const SearchView()),
                  ),
                );
              },
              icon: const Icon(
                Icons.search_outlined,
                size: 30,
              ),
            ),
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is LoadingWeatherState) {
              return const LoadingBody();
            } else if (state is LoadedWeatherState) {
              return const WeatherInfoBody();
            } else {
              return const NoWeatherBody();
            }
          },
        ));
  }
}
