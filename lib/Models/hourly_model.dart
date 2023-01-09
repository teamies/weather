// class Hourly {
//   late double temp;
//   late double feelslike;// cam giac that
//   late int pressure;//ap suat
//   late int humidity;//do am
//   late var uvi;
//   late int visibility;//tam nhin xa
//   late double windspeed;//toc do gio
//   late String main;
//   late String description;

//   Hourly({
//     required this.temp,required this.feelslike, required this.pressure, 
//     required this.humidity,required this.uvi, required this.visibility,
//     required this.windspeed, required this.main,  
//     required this.description}
//   );

//   factory Hourly.fromJson(Map<String, dynamic> json) {
//     return Hourly(
//       temp: json['hourly'][10]['temp'], 
//       feelslike: json['hourly'][10]['feels_like'], 
//       pressure: json['hourly'][10]['pressure'], 
//       humidity: json['hourly'][10]['humidity'], 
//       uvi: json['hourly'][10]['uvi'], 
//       visibility: json['hourly'][10]['visibility'], 
//       windspeed: json['hourly'][10]['wind_speed'],
//       main: json['hourly'][10]['weather'][0]['main'],
//       description: json['hourly'][10]['weather'][0]['description']
//     );
//   }
// }



import 'package:intl/intl.dart';

import 'weather_model.dart';

class Hourly {
  num? dt;
  String? dt_hour;
  String? dt_day;
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
  num? pop;
  Rain? rain;

  Hourly(
      {this.dt,
      this.dt_hour,
      this.dt_day,
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
      this.weather,
      this.pop,
      this.rain});

  Hourly.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    dt_hour = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
    dt_day = DateFormat.yMd('vi').format(DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
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
    // windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    
    pop = json['pop'];
    rain =  json['rain'] != null ? Rain.fromJson(json['rain']) : null ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
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
    data['pop'] = this.pop;
    if (this.rain != null) {
      data['rain'] = this.rain!.toJson();
    }
    return data;
  }

  // static amountrain (Rain rain){
  //   if (rain == null ) {
  //     return '0';
  //   } 
  //   return rain;
  // }

  static windDegCondition(num windDeg1) {
    if (windDeg1 == 0 && windDeg1 == 360) {
      return 'Bắc';
    } else if (0 < windDeg1 && windDeg1 <= 22.5) {
      return 'Bắc đông bắc';
    } else if (22.5 < windDeg1 && windDeg1 <= 67.5) {
      return 'Đông bắc';
    } else if (67.5 < windDeg1 && windDeg1 < 90) {
      return 'Đông đông bắc';
    } else if (90 == windDeg1) {
      return 'Đông';
    } else if (90 < windDeg1 && windDeg1 <= 112.5) {
      return 'Đông đông nam';
    } else if (112.5 < windDeg1 && windDeg1 <= 157.5) {
      return 'Đông nam';
    } else if (157.5 < windDeg1 && windDeg1 < 180) {
      return 'Nam đông nam';
    } else if (180 == windDeg1) {
      return 'Nam';
    } else if (180 < windDeg1 && windDeg1 <= 202.5) {
      return 'Nam tây nam';
    } else if (202.5 < windDeg1 && windDeg1 <= 247.5) {
      return 'Tây nam';
    } else if (247.5 < windDeg1 && windDeg1 < 270) {
      return 'Tây tây nam';
    } else if (270 == windDeg1) {
      return 'Tây ';
    } else if (270 < windDeg1 && windDeg1 <= 292.5) {
      return 'Tây tây bắc';
    } else if (292.5 < windDeg1 && windDeg1 <= 337.5) {
      return 'Tây bắc';
    } else if (337.5 < windDeg1 && windDeg1 < 360) {
      return 'Bắc tây bắc';
    }
    return 'windDeg1';
  }


}

class Rain {
  num? d1h;

  Rain({this.d1h});

  Rain.fromJson(Map<String, dynamic> json) {
    d1h = json['1h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1h'] = this.d1h;
    return data;
  }
}