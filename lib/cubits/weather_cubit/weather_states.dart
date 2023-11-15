class WeatherStates {}

class InitialWeatherState extends WeatherStates {}

class LoadingWeatherState extends WeatherStates {}

class LoadedWeatherState extends WeatherStates {}

class FailerWeatherState extends WeatherStates {
  final String errorMessage;

  FailerWeatherState({required this.errorMessage});
}
