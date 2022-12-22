
import 'package:flutter_app_weather/Models/temp_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/province_model.dart';



// class ProvineController extends GetxController {
//   Future<Province> getProvine() async {
    
//     final response = await http.get(Uri.parse(
//         'http://api.openweathermap.org/geo/1.0/direct?q=Ngọc Lặc&limit=5&appid=ac2e59088cbe65dddd76cc799a3f7efb'));

// https://api.openweathermap.org/data/2.5/onecall?lat=21.592477&lon=105.8435398&units=metric&appid=ac2e59088cbe65dddd76cc799a3f7efb
   
const appid = 'ac2e59088cbe65dddd76cc799a3f7efb';
const baseUrl = 'https://api.openweathermap.org/';
final locationUrl = (city) => '${baseUrl}/geo/1.0/direct?q=${city}&limit=5&appid=${appid}';
// int lat, lon;
// final weatherUrl = (lat)  => '${baseUrl}data/2.5/onecall?lat=${lat}&lon=${lon}&units=metric&appi=${appid}';

class ProvineController extends GetxController {
  // final http.Client httpClient;

  // ProvineController():assert(httpClient != null);

  Future<Province> getDailyLocationIdFromCity(String city) async{
    final response = await http.get(Uri.parse(locationUrl(city)));
    if (response.statusCode == 200) {
      print(response.body);
      // return Province.fromJson(jsonDecode(response.body)[0]);
      final cities = jsonDecode(response.body) as List;
      return (cities.first) ?? 0;
      //  (cities.first)['lon'] ?? 0;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      // throw Exception('Failed to load album');
      throw Exception('error getting location id of : ${city}');
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
}