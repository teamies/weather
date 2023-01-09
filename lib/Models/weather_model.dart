
enum WeatherCondition {
  thunderstorm,
  lightrain,
  moderaterain,
  snow,
  fewclouds, // dust, ash, fog, sand etc.
  scatteredclouds,
  brokenclouds,
  overcastClouds,
  clearSky,
  // lightCloud,
  // heavyCloud,
  // clear,
  unknown
}

class Weather {
  num? id;
  String? main;
  String? description;
  String? icon;
  late WeatherCondition condition;
  Weather({this.id, this.main, this.description, this.icon, required this.condition});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = WCondition(json['description']);
    icon = json['icon'];
    condition = mapStringToWeatherCondition(json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['description'] = this.condition;
    return data;
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
      
      case 'overcast clouds':
        condition = WeatherCondition.overcastClouds;
        break;
      case 'clear sky':
        condition = WeatherCondition.clearSky;
        break;
      
      default:
        condition = WeatherCondition.unknown;
    }

    return condition;
  }

}