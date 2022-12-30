// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controller/hourly_controller.dart';

// class Hour extends GetView<HourlyController> {
//   const Hour({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  FutureBuilder(
//       future: controller.getHourly(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Column(
//             children: [
//             //   Text('sunrise: ${snapshot.data!.sunrise}'),
//               // Text('sunset: ' + snapshot.data!.sunset.toString()),
//               Text('temp: ' + snapshot.data!.temp.toString()+ "\u00B0"),
//               Text('feels like: ${snapshot.data!.feelslike}'+ "\u00B0"),
//               Text('pressure: ${snapshot.data!.pressure}'),
//               Text('humidity: ' + snapshot.data!.humidity.toString() + "%"),
//               Text('uvi: ' + snapshot.data!.uvi.toString()),
//               Text('visibility: ' + snapshot.data!.visibility.toString()),
//               Text('wind speed: ' + snapshot.data!.windspeed.toString()+ "m/s"),
//               Text('main: ' + snapshot.data!.main),
//               Text('description: ' + snapshot.data!.description),
//             ],
//           );
//         } else {
//             return LinearProgressIndicator();
//           }
//       },
//     );
//   }
// }

import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:flutter_app_weather/controller/current_controller.dart';
import 'package:flutter_app_weather/controller/day_controller.dart';
import '../../../widgets/mapStringToWeatherConditionToImage.dart';
import '../DetailedView/HourlyDetailedView.dart';

class HourlySummaryView extends StatefulWidget {
  @override
  State<HourlySummaryView> createState() => _HourlySummaryViewState();
}

class _HourlySummaryViewState extends State<HourlySummaryView> {
  // const Daily({super.key});
  num? temp;
  late CurrentController _Hourly;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Hourly = new CurrentController();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _Hourly.getCurrent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        'Dự báo theo giờ',
                        style: appStyleText.textStyle18,
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HourlyDetailedView()),
                        );
                      },
                      child: Text('Thêm',
                          style: appStyleText.textStyle18
                              .copyWith(decoration: TextDecoration.underline))),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding:
                    EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.hourly!.length,
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
                              snapshot.data!.hourly![index].dt.toString(),
                              style: appStyleText.textStyle16,
                            ),
                            Container(
                                width: 40,
                                height: 40,
                                child: mapStringToWeatherConditionToImage(
                                    snapshot.data!.hourly![0].weather![0]
                                        .condition)),
                            Text(
                              snapshot.data!.hourly![index].temp!
                                      .toStringAsFixed(0) +
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
}
