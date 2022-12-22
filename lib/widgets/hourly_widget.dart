import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/hourly_controller.dart';


class Hour extends GetView<HourlyController> {
  const Hour({super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: controller.getHourly(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
            //   Text('sunrise: ${snapshot.data!.sunrise}'),
              // Text('sunset: ' + snapshot.data!.sunset.toString()),
              Text('temp: ' + snapshot.data!.temp.toString()+ "\u00B0"),
              Text('feels like: ${snapshot.data!.feelslike}'+ "\u00B0"),
              Text('pressure: ${snapshot.data!.pressure}'),
              Text('humidity: ' + snapshot.data!.humidity.toString() + "%"),
              Text('uvi: ' + snapshot.data!.uvi.toString()),
              Text('visibility: ' + snapshot.data!.visibility.toString()),
              Text('wind speed: ' + snapshot.data!.windspeed.toString()+ "m/s"),
              Text('main: ' + snapshot.data!.main),
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