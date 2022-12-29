import 'package:flutter_app_weather/controller/day_controller.dart';
import 'package:flutter_app_weather/controller/hourly_controller.dart';
import 'package:get/get.dart';

import 'province_controller.dart';
import 'current_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => ProvineController());
    Get.lazyPut(() => CurrentController());
    Get.lazyPut(() => HourlyController());
    // Get.lazyPut(() => DayController());
  }
}

class HomeController extends GetxController {

}