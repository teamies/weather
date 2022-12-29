// import 'package:exapi/models/province_model.dart';
// import 'package:exapi/models/new.dart';
import 'package:flutter_app_weather/Models/new.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/textstyle.dart';

class CurrentController {
  Future<apiWeather> getCurrent() async {
   final response = await http.get(Uri.parse(
        url + '?lat=21.592477&lon=105.8435398&units=metric&' + api_key2));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
      // throw Exception('Failed to load Current');
    }
      return apiWeather.fromJson(jsonDecode(response.body));

  }
}
