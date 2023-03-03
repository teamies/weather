class Location {
  final String name;
  final double lon;
  final double lat;

  Location({
    required this.name,
    required this.lon,
    required this.lat,
  });

  static Location fromJson(dynamic json) {
    return Location(
        name: json['name'],
        lon: json['lon'].toDouble(),
        lat: json['lat'].toDouble());
  }

  static Location toJson(String name,dynamic lon,dynamic lat) {

    return Location(
        name: name,
        lon: lon.toDouble(),
        lat: lat.toDouble());
  }
}
