import 'package:flutter/material.dart';
import 'package:flutter_app_weather/views/SummaryView/HourlySummaryView.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app_weather/chart/temperatureChart.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter_app_weather/views/CurrentView/CurrentGridView.dart';
import 'package:flutter_app_weather/views/CurrentView/PlatFormInfo_view.dart';
import 'views/SummaryView/LineChartDailySummaryView.dart';
import 'views/CurrentView/windPressure_view.dart';
import 'package:flutter_app_weather/views/drawer_menu_view.dart';
import 'package:flutter_app_weather/views/main2.dart';

import 'chartView/progressChart/WeekProgressChart.dart';
import 'chartView/views/DailySummaryView.dart';
import 'widgets/day_widget.dart';

// import 'widgets/temp_widget.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Score> _scores;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: FutureBuilder(
//           future:  _daily.get_daily(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               print(snapshot.data!.length);
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                 print(index);
//                 if(index != 2){
//                 return Column(
//                   children: [
//                     Text(index.toString()+ ':'+snapshot.data![index].date.toString()),
//                     Text(index.toString()+ ':'+snapshot.data![index].temp.toString())
//                   ],
//                 );
//                 }
//                 return SizedBox();

//               },);
//             } else {

//             return LinearProgressIndicator();
//             }
//         },)
//       ),
//     );

    initializeDateFormatting('vi');
    return Scaffold(
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/troi-xanh.jpg"))),
            // color: Color.fromARGB(255, 22, 85, 136),
            child: ListView(
              children: List.generate(menus.length, (index) {
                return Center(
                  child: drawerMenu(menu: menus[index]),
                );
              }),
            ),
          ),
        ),
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
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline),
                color: Colors.white),
          ],
        ),

        
        body: Container(
          padding: const EdgeInsets.only(top: 10,bottom: 20, left: 10, right: 10),
          // color: Colors.blue.shade200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/imgThienNhien1.jpg"))),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child:  PlatFormInfo(),
                  ),
                  HourlySummaryView(),
                  CurrentGridView(),

                  // DailySummaryView(),
                  
                  windPressure(),
                  
                  // ForecastDailyView()
                  // Container(
                  //   height: 400,
                  //   child: DailyView(),
                  // ),

                  // temperatureChart(),
                  LineChartDailySummaryView()
                  // LineChartSample1()
                ],
              ),
            ],
          ),
        ));
  }
}
