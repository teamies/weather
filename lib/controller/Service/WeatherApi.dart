

import 'package:flutter_app_weather/Models/apiWeather_model.dart';

import '../../Models/Location.dart';

abstract class WeatherApi {
  Future<apiWeather> getWeather(Location location);
  Future<Location> getLocation(String city);
}
