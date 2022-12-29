import 'dart:convert';

import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:http/http.dart' as http;

class DailyController {
  Future<List<Daily>> get_daily() async {
    List<Daily> _list = [];
    final response = await http.get(Uri.parse(
        url + '?lat=21.592477&lon=105.8435398&units=metric&' + api_key2));
    if (response.statusCode == 200) {
      print('------------------hihhi-------------');
      print(response.body);
      List<dynamic> daily = jsonDecode(response.body)['daily'];
      daily.forEach((element) => _list.add(Daily.fromJson(element)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      // throw Exception('Failed to load album');
    }
    return _list;
  }

  // Future<int> abc() async{
  //   return 1;
  // }

}
