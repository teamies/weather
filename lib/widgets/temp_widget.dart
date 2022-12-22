
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:intl/intl.dart';

import '../controller/temp_controller.dart';



class Current extends GetView<CurrentController> {
  const Current({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: controller.getCurrent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text( 'sunrise: '+  DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.sunrise * 1000))),
              
              // Text('sunrise: '+ snapshot.data!.sunrise.toString()),
              Text('sunset: ' +  DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(snapshot.data!.sunset * 1000))),
              Text('temp: ' + snapshot.data!.temp.toString()+ "\u00B0"),
              Text('feels like: ${snapshot.data!.feelslike}'+ "\u00B0"),
              Text('pressure: ${snapshot.data!.pressure}'),
              Text('humidity: ' + snapshot.data!.humidity.toString() + "%"),
              Text('uvi: ' + snapshot.data!.uvi.toString()),
              Text('visibility: ' + snapshot.data!.visibility.toString()),
              Text('wind speed: ' + snapshot.data!.windspeed.toString()+ "m/s"),
              // Text('main: ' + snapshot.data!.main),
              Text('description: ' + snapshot.data!.description),
            ],
          );
        } else {
            return LinearProgressIndicator();
          }
      },
    );
  }
}