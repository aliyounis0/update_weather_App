import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),
      body: TextFormField(
        onFieldSubmitted: (value) {
          BlocProvider.of<WeatherCubit>(context).getWeather(cityName: value);
          Navigator.pop(context);
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }
}
