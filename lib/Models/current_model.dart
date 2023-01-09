
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:intl/intl.dart';

import 'weather_model.dart';

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
      return 'Bắc';
    } else if (0 < windDeg && windDeg <= 22.5) {
      return 'Bắc đông bắc';
    } else if (22.5 < windDeg && windDeg <= 67.5) {
      return 'Đông bắc';
    } else if (67.5 < windDeg && windDeg < 90) {
      return 'Đông đông bắc';
    } else if (90 == windDeg) {
      return 'Đông';
    } else if (90 < windDeg && windDeg <= 112.5) {
      return 'Đông đông nam';
    } else if (112.5 < windDeg && windDeg <= 157.5) {
      return 'Đông nam';
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
