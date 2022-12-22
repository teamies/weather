import 'package:flutter/material.dart';
import 'package:flutter_app_weather/myHomePage.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       getPages: [
      //Simple GetPage
      GetPage(name: '/home', page: () => const MyHomePage(title: '',), binding: HomeBinding() ),
   
    ]
    );  }
}
