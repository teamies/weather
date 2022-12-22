class Province {
  late String name;
  late double lon;
  late double lat;
  Province({required this.name, required this.lon, required this.lat});
  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
        name: json['name'],
        lon: json['lon'],
        lat: json['lat']);
  }
}