
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:intl/intl.dart';

import 'weather_model.dart';

// enum WeatherCondition {
//   thunderstorm,
//   lightrain,
//   moderaterain,
//   snow,
//   fewclouds, // dust, ash, fog, sand etc.
//   scatteredclouds,
//   brokenclouds,
//   sun,
//   // lightCloud,
//   // heavyCloud,
//   // clear,
//   unknown
// }

// class Current {
//   late String sunrise;//binh minh
//   late String sunset;//hoang hon
//   late num temp;
//   late num feelslike;// cam giac that
//   late num pressure;//ap suat
//   late num humidity;//do am
//   late num uvi;
//   late int visibility;//tam nhin xa
//   late num windspeed;//toc do gio
//   late String winddeg;
//   late WeatherCondition condition;
//   late String description;

//   late var  min;
//   late var max;

//   var date;

//   Current({required this.sunrise,required this.sunset, 
//   required this.temp,required this.feelslike, required this.pressure, 
//   required this.humidity,required this.uvi, required this.visibility,
//   required this.windspeed, required this.winddeg, required this.condition, 
//   required this.description, required this.max, required this.min});
  
//   factory Current.fromJson(Map<String, dynamic> json) {
//     final currentweather = json['current']['weather'][0];
//     final hourlyweather = json['hourly'][0]['weather'][0];
//     return Current(
//       sunrise: DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(json['current']['sunrise'] * 1000)), 
//       sunset: DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(json['current']['sunset'] * 1000)), 
//       temp: json['current']['temp'], 
//       feelslike: json['current']['feels_like'], 
//       pressure: json['current']['pressure'], 
//       humidity: json['current']['humidity'], 
//       uvi: json['current']['uvi'], 
//       visibility: json['current']['visibility'], 
//       winddeg: Daily.windDegCondition(json['current']['wind_speed']),
//       windspeed: json['current']['wind_speed'],
//       condition: mapStringToWeatherCondition(hourlyweather['description']),
//       description: WCondition(hourlyweather['description']) ,
//       min: json['daily'][0]['temp']['min'],
//       max: json['daily'][0]['temp']['max'],
//     );
    
//   }
//   static WCondition (String descriptionVN){
//     String description = '';
//     switch (descriptionVN) {
//       case 'few clouds':
//         description = 'Có mây';
//         break;
//       case 'scattered clouds':
//         description ='Ít mây';
//         break;
//       case 'broken clouds':
//         description ='Nhiều mây';
//         break;
//       case 'overcast clouds':
//         description ='Mây đen';
//         break;

//       case 'light rain':
//         description ='Mưa nhỏ';
//         break;
//       case 'moderate rain':
//         description ='Mưa vừa';
//         break;
      
//     }
//     return description;
//   }

//   static WeatherCondition mapStringToWeatherCondition(
//       String input) {
//     WeatherCondition condition;
//     switch (input) {
//       case 'Thunderstorm':
//         condition = WeatherCondition.thunderstorm;
//         break;
//       case 'light rain':
//         condition = WeatherCondition.lightrain;
//         break;
//       case 'moderate rain':
//         condition = WeatherCondition.moderaterain;
//         break;
//       case 'Snow':
//         condition = WeatherCondition.snow;
//         break;
//       case 'few clouds':
//         condition = WeatherCondition.fewclouds;
//         break;
//       case 'scattered clouds':
//         condition = WeatherCondition.scatteredclouds;
//         break;
//       case 'broken clouds':
//         condition = WeatherCondition.brokenclouds;
//         break;
//       case 'sun':
//         condition = WeatherCondition.sun;
//         break;
      
//       default:
//         condition = WeatherCondition.unknown;
//     }

//     return condition;
//   }

// }




class Current {
  String? dt;
  String? sunrise;
  String? sunset;
  num? temp;
  num? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? uvi;
  num? clouds;
  num? visibility;
  num? windSpeed;
  String? windDeg;
  num? windGust;
  List<Weather>? weather;

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    // dt = json['dt'];
    dt = DateFormat.d().format(DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
    sunrise = DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000));
    sunset = DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000));
    temp = json['temp'];
    feelsLike = json['feels_like'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    uvi = json['uvi'];
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = json['wind_speed'];
    windDeg = windDegCondition(json['wind_deg']);
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['uvi'] = this.uvi;
    data['clouds'] = this.clouds;
    data['visibility'] = this.visibility;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    data['wind_gust'] = this.windGust;
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static windDegCondition(num windDeg) {
    if (windDeg == 0 && windDeg == 360) {
      print('Bắc');
      return 'Bắc';
    } else if (0 < windDeg && windDeg <= 22.5) {
      print('Bắc đông bắc');
      return 'Bắc đông bắc';
    } else if (22.5 < windDeg && windDeg <= 67.5) {
      print('Đông bắc');
      return 'Đông bắc';
    } else if (67.5 < windDeg && windDeg < 90) {
      return 'Đông đông bắc';
    } else if (90 == windDeg) {
      print('Đông');
      return 'Đông';
    } else if (90 < windDeg && windDeg <= 112.5) {
      return 'Đông đông nam';
    } else if (112.5 < windDeg && windDeg <= 157.5) {
      return ('Đông nam');
    } else if (157.5 < windDeg && windDeg < 180) {
      return 'Nam đông nam';
    } else if (180 == windDeg) {
      return 'Nam';
    } else if (180 < windDeg && windDeg <= 202.5) {
      return 'Nam tây nam';
    } else if (202.5 < windDeg && windDeg <= 247.5) {
      return 'Tây nam';
    } else if (247.5 < windDeg && windDeg < 270) {
      return 'Tây tây nam';
    } else if (270 == windDeg) {
      return 'Tây ';
    } else if (270 < windDeg && windDeg <= 292.5) {
      return 'Tây tây bắc';
    } else if (292.5 < windDeg && windDeg <= 337.5) {
      return 'Tây bắc';
    } else if (337.5 < windDeg && windDeg < 360) {
      return 'Bắc tây bắc';
    }
    return windDeg;
  }

}
