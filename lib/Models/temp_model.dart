
import 'package:flutter/cupertino.dart';

enum WeatherCondition {
  thunderstorm,
  lightrain,
  moderaterain,
  snow,
  fewclouds, // dust, ash, fog, sand etc.
  scatteredclouds,
  brokenclouds,
  sun,
  // lightCloud,
  // heavyCloud,
  // clear,
  unknown
}


class Current {
  late int sunrise;//binh minh
  late int sunset;//hoang hon
  late double temp;
  late var feelslike;// cam giac that
  late int pressure;//ap suat
  late int humidity;//do am
  late var uvi;
  late int visibility;//tam nhin xa
  late var windspeed;//toc do gio

  late WeatherCondition condition;
  late String description;

  late var  min;
  late var max;

  var date;

  Current({required this.sunrise,required this.sunset, 
  required this.temp,required this.feelslike, required this.pressure, 
  required this.humidity,required this.uvi, required this.visibility,
  required this.windspeed, required this.condition, required this.description,
  required this.max, required this.min});
  
  factory Current.fromJson(Map<String, dynamic> json) {
    // final newYearsDay = DateTime.fromMillisecondsSinceEpoch((json['current']['sunrise']) * 1000);
    // print(newYearsDay);
    // print('object');
    // var cloudiness = json['current']['clouds'];
    final weather = json['current']['weather'][0];
    return Current(
      sunrise: json['current']['sunrise'], 
      sunset: json['current']['sunset'], 
      temp: json['current']['temp'], 
      feelslike: json['current']['feels_like'], 
      pressure: json['current']['pressure'], 
      humidity: json['current']['humidity'], 
      uvi: json['current']['uvi'], 
      visibility: json['current']['visibility'], 
      windspeed: json['current']['wind_speed'],
      condition: mapStringToWeatherCondition(weather['description']),
      // condition: weather['description'],
      description: WCondition(weather['description']) ,
      min: json['daily'][0]['temp']['min'],
      max: json['daily'][0]['temp']['max'],
    );
    
  }

  static WCondition (String descriptionVN){
    String description = '';
    switch (descriptionVN) {
      case 'few clouds':
        description = 'Có mây';
        break;
      case 'scattered clouds':
        description ='Ít mây';
        break;
      case 'broken clouds':
        description ='Nhiều mây';
        break;
      case 'overcast clouds':
        description ='Mây đen';
        break;

      case 'light rain':
        description ='Mưa nhỏ';
        break;
      case 'moderate rain':
        description ='Mưa vừa';
        break;
      
    }
    return description;
  }


  static WeatherCondition mapStringToWeatherCondition(
      String input) {
    WeatherCondition condition;
    switch (input) {
      case 'Thunderstorm':
        condition = WeatherCondition.thunderstorm;
        break;
      case 'light rain':
        condition = WeatherCondition.lightrain;
        break;
      case 'moderate rain':
        condition = WeatherCondition.moderaterain;
        break;
      case 'Snow':
        condition = WeatherCondition.snow;
        break;
      case 'few clouds':
        condition = WeatherCondition.fewclouds;
        break;
      case 'scattered clouds':
        condition = WeatherCondition.scatteredclouds;
        break;
      case 'broken clouds':
        condition = WeatherCondition.brokenclouds;
        break;
      case 'sun':
        condition = WeatherCondition.sun;
        break;
      
      default:
        condition = WeatherCondition.unknown;
    }

    return condition;
  }

  

}
