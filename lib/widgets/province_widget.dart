
import 'package:flutter/material.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:get/get.dart';

import '../controller/province_controller.dart';

class ProvinceWidget extends GetView<ProvineController> {
  const ProvinceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: controller.getProvine(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            return Column(
            children: [
              // Text('ID:${snapshot.data!.name}',style: appStyleText.textStyle14),
              // Text('title: ${snapshot.data!.lon}',style: appStyleText.textStyle14),
              // Text('lat: ${snapshot.data!.lat}', style: appStyleText.textStyle14,),
            ],
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}