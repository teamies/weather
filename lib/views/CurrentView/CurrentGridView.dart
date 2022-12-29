import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_weather/Models/current_model.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../controller/current_controller.dart';

class CurrentGridView extends StatefulWidget {
  const CurrentGridView({super.key});

  @override
  State<CurrentGridView> createState() => _CurrentGridViewState();
}

class _CurrentGridViewState extends State<CurrentGridView> {
  late CurrentController _current;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _current = new CurrentController();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _current.getCurrent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            // height: 800,
            padding: EdgeInsets.only(top: 25, bottom: 25),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 16, 4, 59)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(15),
                          child: Row(children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: Image.asset(
                                  'assets/img/imgweather/sunrise.png'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Mặt trời mọc',
                                  style: appStyleText.textStyle18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(" ${snapshot.data!.current!.sunrise}",
                                      style: appStyleText.textStyle16),
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 16, 4, 59)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(15),
                          child: Row(children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: Image.asset(
                                  'assets/img/imgweather/sunset.png'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Mặt trời lặn',
                                  style: appStyleText.textStyle18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(" ${snapshot.data!.current!.sunset}",
                                      style: appStyleText.textStyle16),
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 210,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 16, 4, 59)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.only(
                            top: 18,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Độ ẩm",
                                style: appStyleText.textStyle18,
                              ),
                              Container(
                                  height: 170,
                                  child: SfRadialGauge(axes: <RadialAxis>[
                                    RadialAxis(
                                        minimum: 0,
                                        maximum: 100,
                                        //     showLabels: false,
                                        // showAxisLine:false,
                                        showTicks: false,
                                        axisLabelStyle: GaugeTextStyle(
                                            color: Colors.blue.shade400),
                                        // useRangeColorForAxis: true,
                                        ranges: <GaugeRange>[
                                          GaugeRange(
                                            startValue: 0,
                                            endValue: 100,
                                            // color: Colors.amber,
                                            gradient: SweepGradient(colors: [
                                              Colors.blue.shade100,
                                              Colors.blue.shade300,
                                              Colors.blue.shade400,
                                              Colors.blue.shade700,
                                            ]),
                                          ),
                                        ],
                                        pointers: <GaugePointer>[
                                          NeedlePointer(
                                            value: snapshot.data!.current!.humidity!.toDouble(),
                                            needleColor: Colors.blue.shade400,
                                            needleLength: 0.8,
                                            needleEndWidth: 2.5,
                                            knobStyle: KnobStyle(
                                                knobRadius: 0,
                                                sizeUnit:
                                                    GaugeSizeUnit.logicalPixel,
                                                color: Colors.blue.shade400),
                                            enableAnimation: true,
                                          )
                                        ],
                                        annotations: <GaugeAnnotation>[
                                          GaugeAnnotation(
                                              widget: Container(
                                                  child: Text(
                                                      '${snapshot.data!.current!.humidity} %',
                                                      style: appStyleText
                                                          .textStyle18b
                                                          .copyWith(
                                                              fontSize: 20))),
                                              angle: 90,
                                              positionFactor: 0.5)
                                        ])
                                  ])),
                            ],
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        height: 210,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 45,
                                  padding: EdgeInsets.only(right: 15),
                                  child: Image.asset(
                                  'assets/img/imgweather/moderateRain.png')),
                                  // FaIcon(FontAwesomeIcons.droplet, color: Colors.white,)),
                                Text(
                                    ' Mưa',
                                    style: appStyleText.textStyle18,
                                  ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5,bottom: 15),
                              // color: Colors.amber,
                              child: Row(children: [
                                FaIcon(FontAwesomeIcons.droplet,size: 40, color: Colors.white,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Lượng mưa',
                                      style: appStyleText.textStyle18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(" ${snapshot.data!.hourly![0].rain?.d1h}",
                                          style: appStyleText.textStyle16),
                                    )
                                  ],
                                ),
                              ]),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                              FaIcon(FontAwesomeIcons.eye, size: 30, color: Colors.white,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tầm nhìn',
                                    style: appStyleText.textStyle18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(" ${snapshot.data!.current!.visibility} m",
                                        style: appStyleText.textStyle16),
                                  )
                                ],
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }
}
