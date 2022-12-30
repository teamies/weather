import 'package:flutter/material.dart';
import 'package:flutter_app_weather/Models/hourly_model.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_weather/controller/hourly_controller.dart';
import 'package:flutter_app_weather/myHomePage.dart';
import 'package:flutter_app_weather/views/CurrentView/windPressure_view.dart';
import 'package:intl/intl.dart';
import '../../controller/current_controller.dart';
import '../../widgets/mapStringToWeatherConditionToImage.dart';

class HourlyDetailedView extends StatefulWidget {
  const HourlyDetailedView({super.key});

  @override
  State<HourlyDetailedView> createState() => _HourlyDetailedViewState();
}

class _HourlyDetailedViewState extends State<HourlyDetailedView> {
  late HourlyController _Hourly;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Hourly = new HourlyController();
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
            children: [hourlyView(), hourlyDetailView()],
          ),
        ));
  }

  FutureBuilder<List<Hourly>> hourlyView() {
    return FutureBuilder(
      future: _Hourly.getHourly(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                    if (index != 24 &&
                        index != 25 &&
                        index != 26 &&
                        index != 27 &&
                        index != 28 &&
                        index != 29 &&
                        index != 30 &&
                        index != 31 &&
                        index != 32 &&
                        index != 33 &&
                        index != 34 &&
                        index != 35 &&
                        index != 36 &&
                        index != 37 &&
                        index != 38 &&
                        index != 39 &&
                        index != 40 &&
                        index != 41 &&
                        index != 42 &&
                        index != 43 &&
                        index != 44 &&
                        index != 45 &&
                        index != 46 &&
                        index != 47) {
                      return Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data![index].dt.toString(),
                              style: appStyleText.textStyle16,
                            ),
                            Container(
                                width: 40,
                                height: 40,
                                child: mapStringToWeatherConditionToImage(
                                    snapshot.data![0].weather![0].condition)),
                            Text(
                              snapshot.data![index].temp!.toStringAsFixed(0) +
                                  '\u00B0',
                              style: appStyleText.textStyle16,
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox();
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

  FutureBuilder<List<Hourly>> hourlyDetailView() {
    return FutureBuilder(
      future: _Hourly.getHourly(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                height: 600,
                child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (index != 24 &&
                        index != 25 &&
                        index != 26 &&
                        index != 27 &&
                        index != 28 &&
                        index != 29 &&
                        index != 30 &&
                        index != 31 &&
                        index != 32 &&
                        index != 33 &&
                        index != 34 &&
                        index != 35 &&
                        index != 36 &&
                        index != 37 &&
                        index != 38 &&
                        index != 39 &&
                        index != 40 &&
                        index != 41 &&
                        index != 42 &&
                        index != 43 &&
                        index != 44 &&
                        index != 45 &&
                        index != 46 &&
                        index != 47) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20, top: 30),
                        padding: EdgeInsets.only(
                            top: 30, bottom: 40,  right: 20),
                        decoration: BoxDecoration(
                            color:
                                Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 330,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index].dt.toString(),
                                            style: appStyleText.textStyle16,
                                          ),
                                          Text(
                                            // DateFormat.MMMEd('vi').add_jm().format(DateTime.parse(snapshot.data![index].dt.toString())),
                                            snapshot.data![index].dt_day
                                                .toString(),
                                            style: appStyleText.textStyle16,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        snapshot.data![index].temp!
                                                .toStringAsFixed(0) +
                                            '\u00B0',
                                        style: appStyleText.textStyle20.copyWith(fontSize: 40),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          width: 70,
                                          height: 70,
                                          child:
                                              mapStringToWeatherConditionToImage(
                                                  snapshot.data![0].weather![0]
                                                      .condition)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(flex: 1,),
                            Expanded(
                              flex: 4,
                              // child: Container(
                              //   decoration: BoxDecoration(
                              //       border: Border.all(color: Colors.amber)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 250,
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
                                    child: Text(
                                      'Cảm giác thực: ' +
                                          snapshot.data![index].feelsLike!
                                              .toStringAsFixed(0) +
                                          '\u00B0',
                                      style: appStyleText.textStyle16,
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
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
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
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
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
                                    child: Text(
                                      'Chỉ số tia cực tím: ' +
                                          snapshot.data![index].uvi!.toString(),
                                      style: appStyleText.textStyle16,
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
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
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
                                    child: Text(
                                      'Hướng gió: ' +
                                          snapshot.data![index].windDeg
                                              .toString(),
                                      style: appStyleText.textStyle16,
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
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
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
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
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.white))),
                                    child: Text(
                                      'Lượng mưa: ',
                                      //  + snapshot.data![index].rain!.d1h.toString(),
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
                    }
                    return SizedBox();
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
