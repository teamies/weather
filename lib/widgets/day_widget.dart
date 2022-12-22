import 'package:flutter/material.dart';
import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:flutter_app_weather/controller/day_controller.dart';
import 'package:get/get.dart';

class DailyView extends StatelessWidget {
  // const Daily({super.key});
  late ABCde? _abCde;
  @override
  void initState() {
    _abCde = new ABCde();
  }


  @override
  Widget build(BuildContext context) {
    return Center(
          child: FutureBuilder<int>(
            future:  _abCde!.abc(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('abc');
                
              } else {
                
              return LinearProgressIndicator();
              }
          },),
          );
  }
}