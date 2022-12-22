class M_daily{
  
  int? date;
  double? temp,temp_max,temp_min;
  M_daily({
    required this.date,
    required this.temp,
    required this.temp_max,
    required this.temp_min,
  });

  factory M_daily.fromJson(Map<String, dynamic> json){
    return M_daily(
      date: json['dt'],
     temp: json['temp']['day'],
      temp_max: json['temp']['max'], 
      temp_min: json['temp']['min']);
  }

}