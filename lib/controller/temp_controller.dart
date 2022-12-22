
// import 'package:exapi/models/province_model.dart';
// import 'package:exapi/models/new.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/temp_model.dart';
import '../config/textstyle.dart';

class CurrentController extends GetxController {
 Future<Current> getCurrent() async {
    final response = await http.get(Uri.parse(url + '?lat=21.592477&lon=105.8435398&units=metric&'+api_key));
// 'https://api.openweathermap.org/data/2.5/onecall?lat=21.592477&lon=105.8435398&units=metric&appid=ac2e59088cbe65dddd76cc799a3f7efb'));
    if (response.statusCode == 200) {
      print(response.body);
      return Current.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}