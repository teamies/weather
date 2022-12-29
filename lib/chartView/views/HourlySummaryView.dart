import 'dart:math';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather/chartView/progressChart/hoursProgressChart.dart';

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
      final y = rng.nextDouble() * 30.0;
      //final d = DateTime.now().add(Duration(days: -dayHour + index));//1 tuan truoc
      final d = DateTime.now().add(Duration(hours: 1 + index));
      return Score(y, d);
    });

    setState(() {
      _scores = scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  'Dự báo theo giờ',
                  style: appStyleText.textStyle14,
                )),
            TextButton(
                onPressed: () {},
                child: Text('Thêm',
                    style: appStyleText.textStyle14
                        .copyWith(decoration: TextDecoration.underline))),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
              borderRadius: BorderRadius.circular(
                  20)), // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
          child: SizedBox(
            height: 150,
            child: hoursProgressChart(_scores),
          ),
        ),
      ],
    );
  }
}
