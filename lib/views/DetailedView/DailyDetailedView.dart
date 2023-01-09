import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter_app_weather/controller/day_controller.dart';
import 'package:intl/intl.dart';

import '../../widgets/mapStringToWeatherConditionToImage.dart';

class DailyDetailedView extends StatefulWidget {
  const DailyDetailedView({super.key});

  @override
  State<DailyDetailedView> createState() => _DailyDetailedViewState();
}

class _DailyDetailedViewState extends State<DailyDetailedView> {
  late DailyController _Daily;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Daily = new DailyController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff123EB9),
          // backgroundColor: Color.fromARGB(255, 18,62,185),
          //         ),
          title: Center(
            child: Column(
              children: [
                Text('Thái Nguyên',
                    style: appStyleText.textStyle20
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(
                  DateFormat.MMMEd('vi').add_jm().format(DateTime.now()),
                  style: appStyleText.textStyle16,
                )
              ],
            ),
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          // color: Colors.blue.shade200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/imgThienNhien1.jpg"))),

          child: ListView(
            children: [dailyView(), dailyDetailView()],
          ),
        ));
  }

  FutureBuilder<List<Daily>> dailyView() {
    return FutureBuilder(
      future: _Daily.get_daily(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int date = ((DateTime.now().millisecondsSinceEpoch)/1000).toInt();
          int sunrise = snapshot.data![0].sunrise!.toInt();
          int sunset = snapshot.data![0].sunset!.toInt();

          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20, top: 30),
                padding:
                    EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {

                    var imgConditionNight = mapStringToWeatherConditionToImageNight(snapshot .data![index].weather![0].condition);
                    var imgConditionDay = mapStringToWeatherConditionToImageDay(snapshot .data![index].weather![0].condition);
                    
                    return Container(
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data![index].dtday.toString(),
                            style: appStyleText.textStyle16,
                          ),
                          Container(
                              width: 40,
                              height: 40,
                               child: ((date < sunrise) || (date > sunset))? imgConditionNight : imgConditionDay
                          ),
                          Text(
                            snapshot.data![index].temp!.day!
                                    .toStringAsFixed(0) +
                                '\u00B0',
                            style: appStyleText.textStyle16,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

// ----------------------------------------------------------------------

  FutureBuilder<List<Daily>> dailyDetailView() {
    return FutureBuilder(
      future: _Daily.get_daily(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          int date = ((DateTime.now().millisecondsSinceEpoch)/1000).toInt();
          int sunrise = snapshot.data![0].sunrise!.toInt();
          int sunset = snapshot.data![0].sunset!.toInt();

          return Column(
            children: [
              Container(
                height: 600,
                child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {

                  var imgConditionNight = mapStringToWeatherConditionToImageNight(snapshot .data![index].weather![0].condition);
                  var imgConditionDay = mapStringToWeatherConditionToImageDay(snapshot .data![index].weather![0].condition);
                    
                    return Container(
                      margin: EdgeInsets.only(bottom: 20, top: 30),
                      padding: EdgeInsets.only(top: 30, bottom: 40, right: 20),
                      decoration: BoxDecoration(
                          color:
                              Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 400,
                              width: 200,
                              // decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.amber)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: Text(
                                    snapshot.data![index].dt.toString(),
                                    style: appStyleText.textStyle16,
                                  )),
                                  Column(
                                    children: [
                                      Text(
                                        snapshot.data![index].temp!.day!
                                                .toStringAsFixed(0) +
                                            '\u00B0',
                                        style: appStyleText.textStyle20
                                            .copyWith(fontSize: 40),
                                      ),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: ((date < sunrise) || (date > sunset))? imgConditionNight : imgConditionDay
                                      ),
                                    ],
                                    
                                  ),
                                  
                                  Container(
                                    width: 130,
                                    // height: 70,
                                    // decoration: BoxDecoration(
                                    //     border:
                                    //         Border.all(color: Colors.amber)),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 200,
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: Colors.white))),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Buổi sáng: ' +
                                                    snapshot
                                                        .data![index].temp!.morn!
                                                        .toStringAsFixed(0) +
                                                    '\u00B0',
                                                style: appStyleText.textStyle16,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: Colors.white))),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Buổi tối: ' +
                                                    snapshot
                                                        .data![index].temp!.night!
                                                        .toStringAsFixed(0) +
                                                    '\u00B0',
                                                style: appStyleText.textStyle16,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: Colors.white))),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Ban đêm: ' +
                                                    snapshot
                                                        .data![index].temp!.eve!
                                                        .toStringAsFixed(0) +
                                                    '\u00B0',
                                                style: appStyleText.textStyle16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Cảm giác thực: ' +
                                        snapshot.data![index].feelsLike!.day!
                                            .toStringAsFixed(0) +
                                        '\u00B0',
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Mặt trời mọc: ' +
                                        snapshot.data![index].sunrise
                                            .toString(),
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Mặt trời lặn: ' +
                                        snapshot.data![index].sunset.toString(),
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text( snapshot.data![index].moonPhase.toString(),
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Nhiệt độ khí quyển: ' +
                                        snapshot.data![index].dewPoint!
                                            .toStringAsFixed(0) +
                                        '\u00B0',
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'độ ẩm: ' +
                                        snapshot.data![index].humidity!
                                            .toString() +
                                        '%',
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Chỉ số tia cực tím: ' +
                                        snapshot.data![index].uvi!.toString(),
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Áp suất: ' +
                                        snapshot.data![index].pressure
                                            .toString() +
                                        ' hPa',
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Hướng gió: ' +
                                        snapshot.data![index].windDeg
                                            .toString(),
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Tốc độ gió: ' +
                                        snapshot.data![index].windSpeed!
                                            .toString() +
                                        ' m/s',
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    'Mây che phủ: ' +
                                        snapshot.data![index].clouds!
                                            .toString() +
                                        ' %',
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.white))),
                                  child: Text(
                                    (snapshot.data![0].rain != null)
                                        ? "Lượng mưa: ${snapshot.data![0].rain} mm"
                                        : "Lượng mưa:  0 mm",
                                    style: appStyleText.textStyle16,
                                  ),
                                ),
                              ],
                            ),
                            //   ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }
}
