import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather/Models/weather_model.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import '../../controller/day_controller.dart';
import '../../widgets/mapStringToWeatherConditionToImage.dart';

class LineChartDailySummaryView extends StatefulWidget {
  const LineChartDailySummaryView({super.key});

  @override
  State<LineChartDailySummaryView> createState() =>
      _LineChartDailySummaryViewState();
}

class _LineChartDailySummaryViewState extends State<LineChartDailySummaryView> {
  double? miny;
  double? maxy;
  var icond0, icond1, icond2, icond3, icond4, icond5, icond6, icond7;
  late DailyController _daily;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _daily = new DailyController();
  }

  // List<Color> gradientColors = [
  //   const Color(0xff23b6e6),
  //   Color.fromARGB(255, 153, 16, 158),
  // ];

  List<Color> gradientColors = [
    Color.fromARGB(255, 25, 118, 210),
    Color.fromARGB(255, 25, 118, 210),
    // Color.fromARGB(255, 153, 16, 158),
  ];

  List<Color> gradientColorsmax = [
    Colors.red,
    Colors.red,
  ];
  // bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _daily.get_daily(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          icond0 = mapStringToWeatherConditionToImage(
              snapshot.data![0].weather![0].condition);
          icond1 = mapStringToWeatherConditionToImage(
              snapshot.data![1].weather![0].condition);
          icond2 = mapStringToWeatherConditionToImage(
              snapshot.data![2].weather![0].condition);
          icond3 = mapStringToWeatherConditionToImage(
              snapshot.data![3].weather![0].condition);
          icond4 = mapStringToWeatherConditionToImage(
              snapshot.data![4].weather![0].condition);
          icond5 = mapStringToWeatherConditionToImage(
              snapshot.data![5].weather![0].condition);
          icond6 = mapStringToWeatherConditionToImage(
              snapshot.data![6].weather![0].condition);
          icond7 = mapStringToWeatherConditionToImage(
              snapshot.data![7].weather![0].condition);

          miny = [
                snapshot.data![0].temp!.min!.toDouble(),
                snapshot.data![1].temp!.min!.toDouble(),
                snapshot.data![2].temp!.min!.toDouble(),
                snapshot.data![3].temp!.min!.toDouble(),
                snapshot.data![4].temp!.min!.toDouble(),
                snapshot.data![5].temp!.min!.toDouble(),
                snapshot.data![6].temp!.min!.toDouble(),
                snapshot.data![7].temp!.min!.toDouble()
              ].reduce(math.min) -
              5;

          maxy = [
            snapshot.data![0].temp!.max!.toDouble(),
            snapshot.data![1].temp!.max!.toDouble(),
            snapshot.data![2].temp!.max!.toDouble(),
            snapshot.data![3].temp!.max!.toDouble(),
            snapshot.data![4].temp!.max!.toDouble(),
            snapshot.data![5].temp!.max!.toDouble(),
            snapshot.data![6].temp!.max!.toDouble(),
            snapshot.data![7].temp!.max!.toDouble()
          ].reduce(math.max);

          print(miny);
          print(maxy);
          return Column(
            children: [
              Row(
                children: [
                  const Expanded(
                      flex: 1,
                      child: Text(
                        'Dự báo theo ngày',
                        style: appStyleText.textStyle18,
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text('Thêm',
                          style: appStyleText.textStyle18
                              .copyWith(decoration: TextDecoration.underline))),
                ],
              ),
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            width: 600,
                            padding: const EdgeInsets.only(
                              right: 40,
                              left: 40,
                              top: 24,
                              bottom: 12,
                            ),
                            child: LineChart(LineChartData(
                              lineTouchData: LineTouchData(enabled: false),
                              gridData: FlGridData(
                                show: false,
                                drawVerticalLine: true,
                                horizontalInterval: 1,
                                verticalInterval: 1,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Color.fromARGB(255, 55, 77, 65),
                                    strokeWidth: 1,
                                  );
                                },
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: const Color(0xff37434d),
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 120,
                                    interval: 1,
                                    getTitlesWidget: topTitleWidgets,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    // interval: 1,
                                    // getTitlesWidget: leftTitleWidgets,
                                    // reservedSize: 42,
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: false,
                                border:
                                    Border.all(color: const Color(0xff37434d)),
                              ),
                              minX: 0,
                              maxX: 7,
                              minY: miny,
                              maxY: maxy,
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    FlSpot(
                                        0,
                                        snapshot.data![0].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        1,
                                        snapshot.data![1].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        2,
                                        snapshot.data![2].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        3,
                                        snapshot.data![3].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        4,
                                        snapshot.data![4].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        5,
                                        snapshot.data![5].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        6,
                                        snapshot.data![6].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        7,
                                        snapshot.data![7].temp!.max!
                                            .toDouble()),
                                  ],
                                  curveSmoothness: 0,
                                  isCurved: true,
                                  gradient: LinearGradient(
                                    colors: gradientColorsmax,
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(
                                    show: true,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: gradientColorsmax
                                          .map(
                                              (color) => color.withOpacity(0.3))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                LineChartBarData(
                                  spots: [
                                    FlSpot(
                                        -0.5,
                                        snapshot.data![0].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        0,
                                        snapshot.data![0].temp!.max!
                                            .toDouble()),
                                  ],
                                  curveSmoothness: 0,
                                  isCurved: true,
                                  gradient: LinearGradient(
                                    colors: gradientColorsmax,
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: gradientColorsmax
                                          .map(
                                              (color) => color.withOpacity(0.3))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                LineChartBarData(
                                  spots: [
                                    FlSpot(
                                        7,
                                        snapshot.data![7].temp!.max!
                                            .toDouble()),
                                    FlSpot(
                                        7.5,
                                        snapshot.data![7].temp!.max!
                                            .toDouble()),
                                  ],
                                  curveSmoothness: 0,
                                  isCurved: true,
                                  gradient: LinearGradient(
                                    colors: gradientColorsmax,
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: gradientColorsmax
                                          .map(
                                              (color) => color.withOpacity(0.3))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                LineChartBarData(
                                  spots: [
                                    FlSpot(
                                        0,
                                        snapshot.data![0].temp!.min!
                                            .toDouble()),
                                    FlSpot(
                                        1,
                                        snapshot.data![1].temp!.min!
                                            .toDouble()),
                                    FlSpot(
                                        2,
                                        snapshot.data![2].temp!.min!
                                            .toDouble()),
                                    FlSpot(
                                        3,
                                        snapshot.data![3].temp!.min!
                                            .toDouble()),
                                    FlSpot(
                                        4,
                                        snapshot.data![4].temp!.min!
                                            .toDouble()),
                                    FlSpot(
                                        5,
                                        snapshot.data![5].temp!.min!
                                            .toDouble()),
                                    FlSpot(
                                        6,
                                        snapshot.data![6].temp!.min!
                                            .toDouble()),
                                    FlSpot(
                                        7,
                                        snapshot.data![7].temp!.min!
                                            .toDouble()),
                                  ],
                                  isCurved: true,
                                  curveSmoothness: 0,
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(
                                    show: true,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: gradientColors
                                          .map(
                                              (color) => color.withOpacity(0.7))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                LineChartBarData(
                                  spots: [
                                    FlSpot(
                                        -0.5,
                                        snapshot.data![0].temp!.min!
                                            .toDouble()),
                                    FlSpot(0,
                                        snapshot.data![0].temp!.min!.toDouble())
                                  ],
                                  isCurved: true,
                                  curveSmoothness: 0,
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: gradientColors
                                          .map(
                                              (color) => color.withOpacity(0.7))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                LineChartBarData(
                                  spots: [
                                    FlSpot(
                                        7,
                                        snapshot.data![7].temp!.min!
                                            .toDouble()),
                                    FlSpot(
                                        7.5,
                                        snapshot.data![7].temp!.min!
                                            .toDouble()),
                                  ],
                                  isCurved: true,
                                  curveSmoothness: 0,
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: true,
                                  dotData: FlDotData(
                                    show: false,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                      colors: gradientColors
                                          .map(
                                              (color) => color.withOpacity(0.7))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //
                ],
              ),
            ],
          );
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

  Widget topTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Column(
          children: [
            Text(
              DateFormat.E('vi').format(DateTime.now()),
              style: appStyleText.textStyle16,
            ),
            Text(
              DateFormat.d().format(DateTime.now()),
              style: appStyleText.textStyle16,
            ),
            Container(
              height: 40,
              width: 40,
              child: icond0,
            )
            // mapStringToWeatherConditionToImage(snapshot.data![0].weather![0].condition)
          ],
        );
        break;
      case 1:
        text = Column(
          children: [
            Text(
              DateFormat.E('vi').format(DateTime.now().add(Duration(days: 1))),
              style: appStyleText.textStyle16,
            ),
            Text(
              DateFormat.d().format(DateTime.now().add(Duration(days: 1))),
              style: appStyleText.textStyle16,
            ),
            Container(
              height: 40,
              width: 40,
              child: icond1,
            )
          ],
        );
        break;
      case 2:
        text = Column(
          children: [
            Text(
              DateFormat.E('vi').format(DateTime.now().add(Duration(days: 2))),
              style: appStyleText.textStyle16,
            ),
            Text(
              DateFormat.d().format(DateTime.now().add(Duration(days: 2))),
              style: appStyleText.textStyle16,
            ),
            Container(
              height: 40,
              width: 40,
              child: icond2,
            )
          ],
        );
        break;
      case 3:
        text = Column(
          children: [
            Text(
              DateFormat.E('vi').format(DateTime.now().add(Duration(days: 3))),
              style: appStyleText.textStyle16,
            ),
            Text(
              DateFormat.d().format(DateTime.now().add(Duration(days: 3))),
              style: appStyleText.textStyle16,
            ),
            Container(
              height: 40,
              width: 40,
              child: icond3,
            )
          ],
        );
        break;
      case 4:
        text = Column(
          children: [
            Text(
              DateFormat.E('vi').format(DateTime.now().add(Duration(days: 4))),
              style: appStyleText.textStyle16,
            ),
            Text(
              DateFormat.d().format(DateTime.now().add(Duration(days: 4))),
              style: appStyleText.textStyle16,
            ),
            Container(
              height: 40,
              width: 40,
              child: icond4,
            )
          ],
        );
        break;
      case 5:
        text = Column(
          children: [
            Text(
              DateFormat.E('vi').format(DateTime.now().add(Duration(days: 5))),
              style: appStyleText.textStyle16,
            ),
            Text(
              DateFormat.d().format(DateTime.now().add(Duration(days: 5))),
              style: appStyleText.textStyle16,
            ),
            Container(
              height: 40,
              width: 40,
              child: icond5,
            )
          ],
        );
        break;
      case 6:
        text = Column(
          children: [
            Text(
              DateFormat.E('vi').format(DateTime.now().add(Duration(days: 6))),
              style: appStyleText.textStyle16,
            ),
            Text(
              DateFormat.d().format(DateTime.now().add(Duration(days: 6))),
              style: appStyleText.textStyle16,
            ),
            Container(
              height: 40,
              width: 40,
              child: icond6,
            )
          ],
        );
        break;
      case 7:
        text = Column(
          children: [
            Text(
              DateFormat.E('vi').format(DateTime.now().add(Duration(days: 7))),
              style: appStyleText.textStyle16,
            ),
            Text(
              DateFormat.d().format(DateTime.now().add(Duration(days: 7))),
              style: appStyleText.textStyle16,
            ),
            Container(
              height: 40,
              width: 40,
              child: icond7,
            )
          ],
        );
        break;
      default:
        text = Text(DateFormat.d().format(DateTime.now()));
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  // LineChartData mainData() {

  // }

  
}
