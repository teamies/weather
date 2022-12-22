class Daily {
  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  var moonPhase;
  //temp
  double? tempDay;
  double? min;
  double? max;
  double? tempNight;
  double? tempEve;
  double? tempMorn;
  
  // FeelsLike
  var FLDay;
  var FLNight;
  var FLEve;
  var FLMorn;


  int? pressure;
  int? humidity;
  var dewPoint;
  var windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  // int? clouds;
  // int? pop;
  var uvi;
  
  //weather
  int? id;
  String? main;
  String? description;
  String? icon;

  Daily(
    {this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    // this.clouds,
    // this.pop,
    this.uvi,
    this.tempDay,
    this.tempEve,
    this.tempMorn,
    this.tempNight,
    this.FLDay,
    this.min,
    this.max,
    this.FLEve,
    this.FLMorn,
    this.FLNight,
    

    this.id,
    this.main,
    this.description,
    this.icon
  });



  
  factory Daily.fromJson(Map<String, dynamic> json) {
    // final daily = json['daily'][0];
    return Daily(
      dt: json['dt'], 
      sunrise: json['sunrise'], 
      sunset: json['sunset'], 
      moonrise: json['moonrise'], 
      moonset: json['moonset'], 
      moonPhase: json['moon_phase'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      dewPoint: json['dew_point'],
      windSpeed: json['wind_speed'],
      windDeg: json['wind_deg'],
      windGust: json['wind_gust'],
      uvi: json['uvi'],

      tempDay: json['temp']['day'], 
      min: json['temp']['min'], 
      max: json['temp']['max'], 
      tempNight: json['temp']['night'], 
      tempEve: json['temp']['eve'], 
      tempMorn: json['temp']['morn'],
      

      FLDay: json['feels_like']['day'], 
      FLNight: json['feels_like']['night'], 
      FLEve: json['feels_like']['eve'], 
      FLMorn: json['feels_like']['morn'],

      id: json['weather'][0]['id'], 
      main: json['weather'][0]['main'], 
      description: json['weather'][0]['description'], 
      icon: json['weather'][0]['icon'], 
    );
  }
}

// class Temp {
//   double? day;
//   double? min;
//   double? max;
//   double? night;
//   double? eve;
//   double? morn;

//   Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

//   factory Temp.fromJson(Map<String, dynamic> json) {
//     return Temp(
//       day: daily['temp'][0]['day'], 
//       min: daily['temp'][0]['min'], 
//       max: daily['temp'][0]['max'], 
//       night: daily['temp'][0]['night'], 
//       eve: daily['temp'][0]['eve'], 
//       morn: daily['temp'][0]['morn'],
//     );
//   }
// }

// class FeelsLike {
//   double? day;
//   double? night;
//   double? eve;
//   double? morn;

//   FeelsLike({this.day, this.night, this.eve, this.morn});

//   factory FeelsLike.fromJson(Map<String, dynamic> json) {
//     return FeelsLike(
//       day: json['daily'][10]['feels_like'][0]['day'], 
//       night: json['daily'][10]['feels_like'][0]['night'], 
//       eve: json['daily'][10]['feels_like'][0]['eve'], 
//       morn: json['daily'][10]['feels_like'][0]['morn'],
//     );
//   }
  
// }


class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

   factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['daily'][10]['id'], 
      main: json['daily'][10]['main'], 
      description: json['daily'][10]['description'], 
      icon: json['daily'][10]['icon'], 
    );
  }
}
