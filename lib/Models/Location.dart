class Location {
  final double lon;
  final double lat;

  Location({
    required this.lon,
    required this.lat,
  });

  static Location fromJson(dynamic json) {
    return Location(
        lon: json['coord']['lon'].toDouble(),
        lat: json['coord']['lat'].toDouble());
  }
}
