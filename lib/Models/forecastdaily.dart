

import 'dart:convert';

import 'day_model.dart';
import 'current_model.dart';

class Forecast {
  final DateTime lastUpdated;
  final double longitude;
  final double latitude;
  final List<Daily> daily;
  // final Current current;
  final bool isDayTime;
  // String city;

  Forecast(
      {required this.lastUpdated,
      required this.longitude,
      required this.latitude,
      this.daily: const [],
      // required this.current,
      // required this.city,
      required this.isDayTime});

  static Forecast fromJson(dynamic json) {
    var weather = json['current']['weather'][0];
    var date = DateTime.fromMillisecondsSinceEpoch(json['current']['dt'] * 1000,
        isUtc: true);

    var sunrise = DateTime.fromMillisecondsSinceEpoch(
        json['current']['sunrise'] * 1000,
        isUtc: true);

    var sunset = DateTime.fromMillisecondsSinceEpoch(
        json['current']['sunset'] * 1000,
        isUtc: true);

    bool isDay = date.isAfter(sunrise) && date.isBefore(sunset);

    // get the forecast for the next 3 days, excluding the current day
    bool hasDaily = json['daily'] != null;
    List<Daily> tempDaily = [];
    if (hasDaily) {
      List items = json['daily'];
      tempDaily = items
          .map((item) => Daily.fromJson(jsonDecode(item)))
          .toList()
          .skip(1)
          .take(3)
          .toList();
    }
    return Forecast(
        lastUpdated: DateTime.now(),
        // current: currentForcast,
        latitude: json['lat'].toDouble(),
        longitude: json['lon'].toDouble(),
        daily: tempDaily,
        isDayTime: isDay);
  }
}
