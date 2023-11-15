import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(InitialWeatherState());

  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    emit(LoadingWeatherState());
    try {
      weatherModel =
          await WeatherService(dio: Dio()).getWeather(cityname: cityName);
      emit(LoadedWeatherState());
    } catch (e) {
      emit(FailerWeatherState(errorMessage: e.toString()));
    }
  }
}
