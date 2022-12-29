
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter_app_weather/chartView/progressChart/WeekProgressChart.dart';
import '../../controller/day_controller.dart';

class MenuTemp {
  final  num a;
  const MenuTemp({ required this.a});
} 


const List<MenuTemp> menusa = const <MenuTemp>[
  MenuTemp(a: 10),
  MenuTemp(a: 11),
  MenuTemp(a: 12),
  MenuTemp(a: 13),
  MenuTemp(a: 14),
  MenuTemp(a: 15),
  MenuTemp(a: 16),
  MenuTemp(a: 17),

];


class DailySummaryView extends StatefulWidget {
  const DailySummaryView({super.key});

  @override
  State<DailySummaryView> createState() => _DailySummaryViewState();
}
final rng = Random();
const dayCount = 8;
class _DailySummaryViewState extends State<DailySummaryView> {
  late DailyController _daily;

  late List<Score> _scores;

  @override
  void initState() {
    super.initState();
    _daily = new DailyController();

    final scores = List<Score>.generate(dayCount, (index) {
      final y = rng.nextDouble() * 30.0;
      // double y = snapshot.data![index].tempDay;
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
    return  Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Text(
                                'Dự báo theo ngày',
                                style: appStyleText.textStyle14,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text('Thêm',
                                  style: appStyleText.textStyle14.copyWith(
                                      decoration: TextDecoration.underline))),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(
                                20)), // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
                        child: SizedBox(
                          height: 150,
                          child: WeekProgressChart(_scores),
                        ),
                      ),
                    ],
                  );
      
    
  }
}

 
