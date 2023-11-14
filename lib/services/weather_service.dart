import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "2871239304bf4b178af193020232003";
  Future<WeatherModel> getWeather() async {
    try {
      Response response = await dio.get(
          "$baseUrl/forecast.json?key=$apiKey&q=London&days=1&aqi=no&alerts=no");
      WeatherModel weatherModel = WeatherModel.fromJSON(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "opps, Failed to get weather,try later";
      throw Exception(errorMessage);
    } catch (error) {
      throw Exception("opps, Failed to get weather,try later");
    }
  }
}
