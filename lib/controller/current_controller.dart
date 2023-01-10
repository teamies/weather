
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/allWeather_model.dart';
import '../config/textstyle.dart';

class CurrentController {
  Future<allWeather> getCurrent() async {
   final response = await http.get(Uri.parse(
        url + '/onecall?lat=21.592477&lon=105.8435398&units=metric&' + api_key2));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
      // throw Exception('Failed to load Current');
    }
      return allWeather.fromJson(jsonDecode(response.body));

  }
}

// import 'dart:convert';
// import 'package:flutter_app_weather/Models/apiWeather_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:developer';
//  import '../config/textstyle.dart';
// import '../Models/Location.dart';
// import 'Service/WeatherApi.dart';


// class CurrentController{

//   Future<Location> getLocation(String city) async {
//     final requestUrl = '$url/weather?q=$city&$api_key2';
//     final response = await http.get(Uri.parse(requestUrl));
//     // final response = await this.httpClient.get(Uri.encodeFull(requestUrl));

//     if (response.statusCode != 200) {
//       throw Exception(
//           'error retrieving location for city $city: ${response.statusCode}');
//     }

//     return Location.fromJson(jsonDecode(response.body));
//   }

//   @override
//   Future<apiWeather> getCurrent(Location location) async {
//     final requestUrl =
//         '$url/onecall?lat=${location.lat}&lon=${location.lon}&units=metric&$api_key2';
//     final response = await http.get(Uri.parse(requestUrl));
//     // final response = await this.httpClient.get(Uri.encodeFull(requestUrl));

//     if (response.statusCode != 200) {
//       throw Exception('error retrieving weather: ${response.statusCode}');
//     }

//     return apiWeather.fromJson(jsonDecode(response.body));
//   }
// }

