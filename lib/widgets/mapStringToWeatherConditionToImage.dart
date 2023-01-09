import 'package:flutter/cupertino.dart';

import '../Models/weather_model.dart';

Widget mapStringToWeatherConditionToImageDay(WeatherCondition condition) {
    Image img;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        img = Image.asset('assets/img/imgweather/Thunderstorm.png');
        break;
      case WeatherCondition.lightrain:
        img = Image.asset('assets/img/imgweather/lightRain_d.png');
        break;
      case WeatherCondition.moderaterain:
        img = Image.asset('assets/img/imgweather/moderateRain.png');
        break;
      case WeatherCondition.snow:
        img = Image.asset('assets/img/imgweather/snow.png');
        break;
      case WeatherCondition.fewclouds:
        img = Image.asset('assets/img/imgweather/fewclouds_d.png');
        break;
      case WeatherCondition.scatteredclouds:
        img = Image.asset('assets/img/imgweather/scatteredclouds_d.png');
        break;
      case WeatherCondition.brokenclouds:
        img = Image.asset('assets/img/imgweather/brokenclouds.png');
        break;
      case WeatherCondition.overcastClouds:
        img = Image.asset('assets/img/imgweather/overcastclouds.png');
        break;
      case WeatherCondition.clearSky:
        img = Image.asset('assets/img/imgweather/clearSky_d.png');
        break;

      default:
        img = Image.asset('assets/img/imgweather/brokenclouds.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: img);
  }

  Widget mapStringToWeatherConditionToImageNight(WeatherCondition condition) {
    Image img;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        img = Image.asset('assets/img/imgweather/Thunderstorm.png');
        break;
      case WeatherCondition.lightrain:
        img = Image.asset('assets/img/imgweather/lightRain_n.png');
        break;
      case WeatherCondition.moderaterain:
        img = Image.asset('assets/img/imgweather/moderateRain.png');
        break;
      case WeatherCondition.snow:
        img = Image.asset('assets/img/imgweather/snow.png');
        break;
      case WeatherCondition.fewclouds:
        img = Image.asset('assets/img/imgweather/fewclouds_n.png');
        break;
      case WeatherCondition.scatteredclouds:
        img = Image.asset('assets/img/imgweather/fewclouds_n.png');
        break;
      case WeatherCondition.brokenclouds:
        img = Image.asset('assets/img/imgweather/brokenclouds.png');
        break;
      case WeatherCondition.overcastClouds:
        img = Image.asset('assets/img/imgweather/overcastclouds.png');
        break;
      case WeatherCondition.clearSky:
        img = Image.asset('assets/img/imgweather/clearSky_n.png');
        break;

      default:
        img = Image.asset('assets/img/imgweather/brokenclouds.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: img);
  }