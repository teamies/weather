import 'package:flutter_app_weather/Models/allWeather_model.dart';
import 'package:flutter_app_weather/controller/Service/WeatherApi.dart';
class ForecastService {
  final WeatherApi weatherApi;
  ForecastService(this.weatherApi);

  Future<allWeather> getWeather(String city) async {
    final location = await weatherApi.getLocation(city);
    return await weatherApi.getWeather(location);
  }
}
