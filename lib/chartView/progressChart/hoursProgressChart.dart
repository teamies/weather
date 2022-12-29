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

class hoursProgressChart extends StatefulWidget {
  final List<Score> scores;
  hoursProgressChart(this.scores);
  @override
  State<hoursProgressChart> createState() => _hoursProgressChartState();
}

const hours = ["0","1","2","3","4","5","6","7","8","9","10",
                "11","12","13","14","15","16","17","18","19","20",
                "21","22","23",
];
class _hoursProgressChartState extends State<hoursProgressChart> {
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
            .map((p) => "${hours[p.time.hour]}")
            .toList();
     }); 
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: 
          Container(
            width: 900,
            child: CustomPaint(
              child: Container(),
              painter: ChartPaint(_X, _Y, _min, _max),
            ),
          ),
      );
    }
}
