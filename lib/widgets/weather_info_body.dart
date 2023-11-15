import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<WeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getAppColor(weatherModel.weatherStatus),
            getAppColor(weatherModel.weatherStatus)[100]!,
            getAppColor(weatherModel.weatherStatus)[50]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              weatherModel.lastUpdate,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weatherModel.image,
                ),
                Text(
                  weatherModel.avgTemp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Maxtemp: ${weatherModel.maxTemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Mintemp: ${weatherModel.minTemp.round()}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherStatus,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

MaterialColor getAppColor(String? weatherState) {
  if (weatherState == null) {
    return Colors.blueGrey;
  }
  switch (weatherState) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Partly cloudy":
      return Colors.blue;
    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Freezing fog":
    case "Fog":
      return Colors.grey;
    case "lightgray":
    case "Patchy sleet":
    case "Patchy freezing drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Moderate or heavy sleet showers":
    case "Light showers of ice pellets":
    case "Light sleet showers":
    case "Moderate or heavy showers of ice pellets":
    case "Patchy rain":
    case "Light drizzle":
    case "Light rain":
    case "Moderate rain":
    case "Heavy rain":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.lightBlue;
    case "Patchy snow":
    case "Blowing snow":
    case "Blizzard":
    case "Light snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light snow with thunder":
      return Colors.blueGrey;
    case "Thundery outbreaks":
      return Colors.purple;
    default:
      return Colors.blue;
  }
}
