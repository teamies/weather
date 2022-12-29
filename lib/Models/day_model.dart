// import 'package:flutter/cupertino.dart';

// class Daily {
//   int? dt;
//   int? sunrise;
//   int? sunset;
//   int? moonrise;
//   int? moonset;
//   num? moonPhase;
//   //temp
//   num? tempDay;
//   num? tempmin;
//   num? tempmax;
//   num? tempNight;
//   num? tempEve;
//   num? tempMorn;

//   // FeelsLike
//   num? FLDay;
//   num? FLNight;
//   num? FLEve;
//   num? FLMorn;

//   num? pressure;
//   num? humidity;
//   num? dewPoint;
//   num? windSpeed;
//   String? windDeg;
//   num? windGust;
//   // List<Weather>? weather;
//   // int? clouds;
//   // int? pop;
//   num? uvi;
//   num? rain;
//   num? snow;
//   //weather
//   num? id;
//   String? main;
//   String? description;
//   String? icon;

//   Daily(
//       {this.dt,
//       this.sunrise,
//       this.sunset,
//       this.moonrise,
//       this.moonset,
//       this.moonPhase,
//       this.pressure,
//       this.humidity,
//       this.dewPoint,
//       this.windSpeed,
//       this.windDeg,
//       this.windGust,
//       // this.weather,
//       // this.clouds,
//       // this.pop,
//       this.uvi,
//       this.rain,
//       this.snow,
//       this.tempDay,
//       this.tempEve,
//       this.tempMorn,
//       this.tempNight,
//       this.FLDay,
//       this.tempmin,
//       this.tempmax,
//       this.FLEve,
//       this.FLMorn,
//       this.FLNight,
//       this.id,
//       this.main,
//       this.description,
//       this.icon});

//   factory Daily.fromJson(Map<String, dynamic> json) {
//     // final daily = json['daily'][0];
//     return Daily(
//       dt: json['dt'],
//       sunrise: json['sunrise'],
//       sunset: json['sunset'],
//       moonrise: json['moonrise'],
//       moonset: json['moonset'],
//       moonPhase: json['moon_phase'],
//       pressure: json['pressure'],
//       humidity: json['humidity'],
//       dewPoint: json['dew_point'],
//       windSpeed: json['wind_speed'],
//       windDeg: windDegCondition(json['wind_deg']),
//       windGust: json['wind_gust'],
//       uvi: json['uvi'],
//       rain: json['rain'],
//       snow: json['snow'],
//       tempDay: json['temp']['day'],
//       tempmin: json['temp']['min'],
//       tempmax: json['temp']['max'],
//       tempNight: json['temp']['night'],
//       tempEve: json['temp']['eve'],
//       tempMorn: json['temp']['morn'],
//       FLDay: json['feels_like']['day'],
//       FLNight: json['feels_like']['night'],
//       FLEve: json['feels_like']['eve'],
//       FLMorn: json['feels_like']['morn'],
//       id: json['weather'][0]['id'],
//       main: json['weather'][0]['main'],
//       description: json['weather'][0]['description'],
//       icon: json['weather'][0]['icon'],
//     );
//   }

//   static windDegCondition(num windDeg) {
//     if (windDeg == 0 && windDeg == 360) {
//       print('Bắc');
//       return 'Bắc';
//     } else if (0 < windDeg && windDeg <= 22.5) {
//       print('Bắc đông bắc');
//       return 'Bắc đông bắc';
//     } else if (22.5 < windDeg && windDeg <= 67.5) {
//       print('Đông bắc');
//       return 'Đông bắc';
//     } else if (67.5 < windDeg && windDeg < 90) {
//       return 'Đông đông bắc';
//     } else if (90 == windDeg) {
//       print('Đông');
//       return 'Đông';
//     } else if (90 < windDeg && windDeg <= 112.5) {
//       return 'Đông đông nam';
//     } else if (112.5 < windDeg && windDeg <= 157.5) {
//       return ('Đông nam');
//     } else if (157.5 < windDeg && windDeg < 180) {
//       return 'Nam đông nam';
//     } else if (180 == windDeg) {
//       return 'Nam';
//     } else if (180 < windDeg && windDeg <= 202.5) {
//       return 'Nam tây nam';
//     } else if (202.5 < windDeg && windDeg <= 247.5) {
//       return 'Tây nam';
//     } else if (247.5 < windDeg && windDeg < 270) {
//       return 'Tây tây nam';
//     } else if (270 == windDeg) {
//       return 'Tây ';
//     } else if (270 < windDeg && windDeg <= 292.5) {
//       return 'Tây tây bắc';
//     } else if (292.5 < windDeg && windDeg <= 337.5) {
//       return 'Tây bắc';
//     } else if (337.5 < windDeg && windDeg < 360) {
//       return 'Bắc tây bắc';
//     }
//     return windDeg;
//   }
// }






import 'package:flutter_app_weather/Models/weather_model.dart';

class Daily {
  num? dt;
  num? sunrise;
  num? sunset;
  num? moonrise;
  num? moonset;
  num? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  num? pressure;
  num? humidity;
  num? dewPoint;
  num? windSpeed;
  String? windDeg;
  num? windGust;
  List<Weather>? weather;
  num? clouds;
  num? pop;
  num? rain;
  num? uvi;

  Daily(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.windGust,
      this.weather,
      this.clouds,
      this.pop,
      this.rain,
      this.uvi});

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? new FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'];
    windSpeed = json['wind_speed'];
    windDeg = windDegCondition(json['wind_deg']);
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    pop = json['pop'];
    rain = json['rain'];
    uvi = json['uvi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    if (this.temp != null) {
      data['temp'] = this.temp!.toJson();
    }
    if (this.feelsLike != null) {
      data['feels_like'] = this.feelsLike!.toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['dew_point'] = this.dewPoint;
    data['wind_speed'] = this.windSpeed;
    data['wind_deg'] = this.windDeg;
    data['wind_gust'] = this.windGust;
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = this.clouds;
    data['pop'] = this.pop;
    data['rain'] = this.rain;
    data['uvi'] = this.uvi;
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

class Temp {
  num? day;
  num? min;
  num? max;
  num? night;
  num? eve;
  num? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class FeelsLike {
  num? day;
  num? night;
  num? eve;
  num? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}