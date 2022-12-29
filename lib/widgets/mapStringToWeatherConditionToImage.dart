import 'package:flutter/cupertino.dart';

import '../Models/weather_model.dart';

Widget mapStringToWeatherConditionToImage(WeatherCondition condition) {
    Image img;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        img = Image.asset('assets/img/imgweather/Thunderstorm.png');
        break;
      case WeatherCondition.lightrain:
        img = Image.asset('assets/img/imgweather/lightrain.png');
        break;
      case WeatherCondition.moderaterain:
        img = Image.asset('assets/img/imgweather/moderateRain.png');
        break;
      case WeatherCondition.snow:
        img = Image.asset('assets/img/imgweather/snow.png');
        break;
      case WeatherCondition.fewclouds:
        img = Image.asset('assets/img/imgweather/fewclouds.png');
        break;
      case WeatherCondition.scatteredclouds:
        img = Image.asset('assets/img/imgweather/scatteredclouds.png');
        break;
      case WeatherCondition.brokenclouds:
        img = Image.asset('assets/img/imgweather/brokenclouds.png');
        break;
      // case 'overcast clouds':
      //   condition = Image.asset('assets/img/imgweather/fewclouds.png');
      //   break;
      case WeatherCondition.sun:
        img = Image.asset('assets/img/imgweather/sun.png');
        break;

      default:
        img = Image.asset('assets/img/imgweather/brokenclouds.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: img);
  }