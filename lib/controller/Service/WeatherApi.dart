

import 'package:flutter_app_weather/Models/allWeather_model.dart';

import '../../Models/Location.dart';

abstract class WeatherApi {
  Future<allWeather> getWeather(Location location);
  Future<Location> getLocation(String city);
}
