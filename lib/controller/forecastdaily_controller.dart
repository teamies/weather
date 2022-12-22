// import 'dart:html';

import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/forecastdaily.dart';

class ForecastDailyController extends GetxController {
 Future<Forecast> getDaily1() async {
 
    final response = await http.get(Uri.parse(
        // 'http://api.openweathermap.org/geo/1.0/direct?q=Ngọc Lặc&limit=5&appid=ac2e59088cbe65dddd76cc799a3f7efb'));

// http://api.openweathermap.org/data/2.5/weather?q=Turan&appid=0b02ee1c6dd9dafd7a2a8a0780323cc2
'https://api.openweathermap.org/data/2.5/onecall?lat=21.592477&lon=105.8435398&units=metric&appid=ac2e59088cbe65dddd76cc799a3f7efb'));
    if (response.statusCode == 200) {
      print(response.body);
      return Forecast.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}