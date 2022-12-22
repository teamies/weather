
import 'dart:developer';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather/api/HourApi.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter_app_weather/views/DailySummaryView.dart';
import 'package:flutter_app_weather/views/drawer_menu_view.dart';
import 'package:flutter_app_weather/icons/icon_weather_icons.dart';
import 'package:flutter_app_weather/chart/temperatureChart.dart';
import 'package:flutter_app_weather/views/PlatFormInfo_view.dart';
import 'package:flutter_app_weather/views/windPressure_view.dart';
import 'package:intl/intl.dart';

import 'chart/progressChart/WeekProgressChart.dart';
import 'controller/day_controller.dart';
import 'views/hourlyForecast.dart';
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
    
     
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/troi-xanh.jpg")
                )),
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
        backgroundColor: Color(0xff123EB9),
        // backgroundColor: Color.fromARGB(255, 18,62,185),
        // leading: IconButton(
        //           onPressed: (){},
        //           icon: Icon(Icons.menu),color: Colors.white,
        //         ),
        title: Center(
          child: 
            Column(
              children: [
                Text('Thái Nguyên', style: appStyleText.textStyle16.copyWith(fontWeight: FontWeight.bold)),
                // Text(DateTime.now().toString())
                Text(
                  DateFormat.MMMEd().add_jm().format(DateTime.now()),
                  style: appStyleText.textStyle14,
                )
              ],
              ),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.add_circle_outline),color: Colors.white),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left:10, right: 10),
              // color: Colors.blue.shade200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/imgThienNhien1.jpg")
                )),
        child: ListView(
          children: [ 
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  child:PlatFormInfo(),
                ),
                
                  
                  // temperatureChart(),
                  
                Column(
                  children: [
                    Row( 
                      children: [
                        Expanded(flex: 1, child: Text('Dự báo theo giờ', style: appStyleText.textStyle14,)),
                        TextButton(
                        onPressed: (){}, 
                          child: Text('Thêm', style: appStyleText.textStyle14.copyWith(decoration: TextDecoration.underline))
                        ),  
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                      // border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)), // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: SizedBox(
                        height: 150,
                        child: HourlySummaryView(),
                      ),
                    ),
                  ],
                ),

                  
                Column(
                  children: [
                    Row( 
                      children: [
                        Expanded(flex: 1, child: Text('Dự báo theo ngày', style: appStyleText.textStyle14,)),
                        TextButton(
                          onPressed: (){}, 
                          child: Text('Thêm', style: appStyleText.textStyle14.copyWith(decoration: TextDecoration.underline))
                        ),  
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                      color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                      // border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)), // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: SizedBox(
                        height: 150,
                        child: DailySummaryView(),
                      ),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.only(right: 15,left: 15, bottom: 15),
                  decoration: BoxDecoration(
                  color: Color.fromARGB(255, 16, 4, 59).withOpacity(0.7),
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)), // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: SizedBox(
                    // height: 150,
                    // child: windPressure(),
                  ),
                ),


                DailyView(),
                
              ],
            ),
          ],
        ),
      )
    );
          
  }

  


}
