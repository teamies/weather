


import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';
 import '../Models/allWeather_model.dart';
import '../config/textstyle.dart';
import '../Models/Location.dart';
import 'Service/WeatherApi.dart';


class ProvineController{

  Future<Location> getLocation(String city) async {
    final response = await http.get(Uri.parse(
        urlLocation + '/direct?q='+ city + api_key2));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      'error retrieving location for city $city: ${response.statusCode}';
    }
      return Location.fromJson(jsonDecode(response.body));

  }
}


  // Future<Current> fetchWeather(double lat ,lon) async{
  //   final response = await http.get(Uri.parse('${baseUrl}data/2.5/onecall?lat=${lat}&lon=${lon}&units=metric&appi=${appid}'));
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     throw Exception('error getting location id of : ${lat} ${lon}');
  //   }
  //     // final wearherJson = jsonDecode(response.body) ;
  //     return Current.fromJson(jsonDecode(response.body));
  // }

  // Future<Current> getWeatherFromCity(String city) async{
  //   final int lat = await getDailyLocationIdFromCity(city);
  //   final int lon = await getDailyLocationIdFromCity(city);
  //   return fetchWeather(lat, lon)
  // }
