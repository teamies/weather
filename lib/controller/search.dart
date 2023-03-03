import 'dart:convert';

import 'package:flutter_app_weather/Models/Location.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../config/textstyle.dart';
class Search {
  Future<List<Location>> getName(city) async{


    late List<Location> _list = [];

    final response = await http.get(Uri.parse(
        urlLocation + '/direct?q='+ city +',VN&limit=5&'+ api_key));
    if (response.statusCode == 200) {
      print("-----------Search Controllera--------------");
      List<dynamic> _json = jsonDecode(response.body) ;
      Location _location;
      print(_json.length);

      if(_json.length > 0){
        print('----has data--------');
        _json.forEach((element) {
          if (element.containsKey('local_names')) {
            _location = Location.toJson(
                (element.containsKey('local_names'))?element['local_names']['vi']:element['name'],
                element['lon'],
                element['lat']);
            _list.add(_location);
          }
        });
        return _list;
      }
    } else {
      print( 'error retrieving location for city $city: ${response.statusCode}');
    }
    return _list;
  }
}