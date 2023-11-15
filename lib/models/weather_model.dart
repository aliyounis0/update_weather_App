class WeatherModel {
  final String cityName;
  final DateTime lastUpdate;
  final String image;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String weatherStatus;

  WeatherModel({
    required this.cityName,
    required this.lastUpdate,
    required this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.weatherStatus,
  });

  factory WeatherModel.fromJSON(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      lastUpdate: DateTime.parse(json["current"]["last_updated"]),
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      weatherStatus: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
