class Hourly {
  late double temp;
  late double feelslike;// cam giac that
  late int pressure;//ap suat
  late int humidity;//do am
  late var uvi;
  late int visibility;//tam nhin xa
  late double windspeed;//toc do gio
  late String main;
  late String description;

  Hourly({
    required this.temp,required this.feelslike, required this.pressure, 
    required this.humidity,required this.uvi, required this.visibility,
    required this.windspeed, required this.main,  
    required this.description}
  );

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      temp: json['hourly'][10]['temp'], 
      feelslike: json['hourly'][10]['feels_like'], 
      pressure: json['hourly'][10]['pressure'], 
      humidity: json['hourly'][10]['humidity'], 
      uvi: json['hourly'][10]['uvi'], 
      visibility: json['hourly'][10]['visibility'], 
      windspeed: json['hourly'][10]['wind_speed'],
      main: json['hourly'][10]['weather'][0]['main'],
      description: json['hourly'][10]['weather'][0]['description']
    );
  }
}