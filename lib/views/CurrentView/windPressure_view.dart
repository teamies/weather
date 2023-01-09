import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:flutter_app_weather/controller/day_controller.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter_app_weather/controller/current_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class windPressure extends StatefulWidget {
  @override
  State<windPressure> createState() => _windPressureState();
}

class _windPressureState extends State<windPressure> {
  // const Daily({super.key});
  late CurrentController _currentWind;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentWind = new CurrentController();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _currentWind.getCurrent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.only(top: 25, bottom: 25),
            // padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                borderRadius: BorderRadius.circular(
                    20)),
            child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.white))),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Gió và áp suất',
                            style: appStyleText.textStyle20,
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            FontAwesomeIcons.wind,
                            size: 100,
                            color: Colors.white,
                          ),
                          Column(
                            children: [
                              Text(snapshot.data!.current!.windDeg!.toString(),
                                  style: appStyleText.textStyle18),
                              Text(snapshot.data!.current!.windSpeed.toString() + ' m/s',
                                  style: appStyleText.textStyle16),
                            ],
                          ),
                          // ignore: prefer_const_constructors
                          Spacer(
                            flex: 1,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                ' Áp suất',
                                style: appStyleText.textStyle18,
                              ),
                              Text(
                                '${snapshot.data!.current!.pressure} hPa',
                                style: appStyleText.textStyle16,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )),
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}
