import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

enum TemperatureUnit {
  Fahrenheit,
  Celsius
}


class SettingsState extends Equatable{
  final TemperatureUnit temperatureUnit;
  const SettingsState({required this.temperatureUnit})
    :assert(temperatureUnit != null); 
  @override
  // TODO: implement props
  List<Object?> get props => [throw UnimplementedError()];
  
}