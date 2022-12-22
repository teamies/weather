
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_weather/chart/progressChart/hoursProgressChart.dart';

class HourlySummaryView extends StatefulWidget {
  const HourlySummaryView({super.key});

  @override
  State<HourlySummaryView> createState() => _HourlySummaryView();
}
final rng = Random();
const dayHour = 24;
class _HourlySummaryView extends State<HourlySummaryView> {
  late List<Score> _scores;

  @override
  void initState() {
    super.initState();
    final scores = List<Score>.generate(dayHour, (index) {
      final y = rng.nextDouble()*30.0;
      //final d = DateTime.now().add(Duration(days: -dayHour + index));//1 tuan truoc
      final d = DateTime.now().add(Duration(hours: 1+ index));
      return Score(y, d);
    });

    setState(() {
      _scores = scores;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: hoursProgressChart(_scores),
             
      
    );
  }
}
