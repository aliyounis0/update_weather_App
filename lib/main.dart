import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/views/splash_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<WeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const SplashView(),
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                ),
                fontFamily: "appFont",
                primarySwatch: getAppColor(
                  BlocProvider.of<WeatherCubit>(context)
                      .weatherModel
                      ?.weatherStatus,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
