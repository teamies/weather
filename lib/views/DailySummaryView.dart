
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather/chart/progressChart/WeekProgressChart.dart';
import 'package:get/get.dart';

import '../controller/day_controller.dart';


// class DailySummary extends GetView<DayController> {
//   const DailySummary({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  FutureBuilder(
//       future: controller.getDaily(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Column(
//             children: [
//               Text('tempDay: ${snapshot.data!.tempDay}'),
//             ],
//           );
//         } else {
//             return LinearProgressIndicator();
//           }
//       },
//     );
//   }
// }


class DailySummaryView extends StatefulWidget {
  const DailySummaryView({super.key});

  @override
  State<DailySummaryView> createState() => _DailySummaryViewState();
}
final rng = Random();
const dayCount = 8;
class _DailySummaryViewState extends State<DailySummaryView> {
  late List<Score> _scores;

  @override
  void initState() {
    super.initState();
    final scores = List<Score>.generate(dayCount, (index) {
      final y = rng.nextDouble()*30.0;
      //final d = DateTime.now().add(Duration(days: -dayCount + index));//1 tuan truoc
      final d = DateTime.now().add(Duration(days: index));
      return Score(y, d);
    });

    setState(() {
      _scores = scores;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: WeekProgressChart(_scores),
             
      
    );
  }
}
