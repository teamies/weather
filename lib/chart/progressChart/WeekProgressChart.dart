import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'ChartPaint.dart';



class Score{
  late double value;
  late DateTime time;
  Score(this.value, this.time);
}

class WeekProgressChart extends StatefulWidget {
  final List<Score> scores;
  WeekProgressChart(this.scores);
  @override
  State<WeekProgressChart> createState() => _WeekProgressChartState();
}

const WeekDays = ["","Th 2","Th 3","Th 4","Th 5","Th 6","Th 7","CN"];
class _WeekProgressChartState extends State<WeekProgressChart> {
  late double _min, _max;
  late List<double> _Y;
  late List<String> _X;

  @override
  void initState() {
    super.initState();
    var min = double.maxFinite;
    var max = -double.maxFinite;
    widget.scores.forEach((p) {
      min = min > p.value ? p.value : min;
      max = max < p.value ? p.value : max;
     });

     setState(() {
       _min = min;
       _max = max;
       _Y = widget.scores.map((p) => p.value).toList();
       _X = widget.scores
            .map((p) => "${WeekDays[p.time.weekday]}\n${p.time.day}")
            .toList();
     }); 
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        child: Container(

        ),
        painter: ChartPaint(_X, _Y, _min, _max),
      ),
    );
  }
}
