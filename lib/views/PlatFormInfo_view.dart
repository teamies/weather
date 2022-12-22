import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather/Models/temp_model.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/temp_controller.dart';


class PlatFormInfo extends GetView<CurrentController> {
  //  final WeatherCondition condition;
  const PlatFormInfo({ Key? key});
  // :super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: controller.getCurrent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return 
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Container(
                    height: 70,
                    width:  70,
                    child: 
                    // Text(snapshot.data!.condition.toString()),
                    mapStringToWeatherConditionToImage(snapshot.data!.condition)
                    // Image.asset('assets/img/Layer1.png')
                    // Image.asset('assets/img/imgweather/scatteredclouds.png')
                  ),

                  // Icon( FontAwesomeIcons.cloudSun, size: 40, color: Colors.white),  
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: 
                      Text(
                        "${snapshot.data!.temp.toStringAsFixed(0)}\u00B0", 
                        style: appStyleText.textStyle14.copyWith(fontSize: 55)),
                      // Text('29', style: appStyleText.textStyle14.copyWith(fontSize: 55)),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.vertical_align_top, color: Colors.white,),
                        Text(
                          "${snapshot.data!.max?.toStringAsFixed(0)}\u00B0", 
                          style: appStyleText.textStyle14),
                        // Text('29',style: appStyleText.textStyle14)
                      ],
                    ),
                  ),
                    
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 15),
                    child: Row(
                      children: [
                        Icon(Icons.vertical_align_bottom, color: Colors.white,),
                        Text(
                          "${snapshot.data!.min?.toStringAsFixed(0)}\u00B0", 
                          style: appStyleText.textStyle14),
                        // Text('23', style: appStyleText.textStyle14)
                      ],
                    ),
                  ),
                    
                  Text(
                    "Cảm giác thực ${snapshot.data!.feelslike.toStringAsFixed(0)}\u00B0",  
                     style: TextStyle(color: Colors.white),
                  )
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  snapshot.data!.description,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                )
              ),

              //  Container(
              //   margin: EdgeInsets.only(top: 15),
              //   child: Text(
              //     snapshot.data!.condition.toString(),
              //     style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              //   )
              // )
              ],
            ),
          );
        } else {
            return LinearProgressIndicator();
          }
      },
    );
  }
Widget mapStringToWeatherConditionToImage(
      WeatherCondition condition) {
    Image img;
    switch (condition) {
      case WeatherCondition.thunderstorm:
        img = Image.asset('assets/img/imgweather/Thunderstorm.png');
        break;
      case WeatherCondition.lightrain :
        img = Image.asset('assets/img/imgweather/lightrain.png');
        break;
      case WeatherCondition.moderaterain:
        img = Image.asset('assets/img/imgweather/moderateRain.png');
        break;
      case WeatherCondition.snow:
        img = Image.asset('assets/img/imgweather/snow.png');
        break;
      case WeatherCondition.fewclouds:
        img = Image.asset('assets/img/imgweather/fewclouds.png');
        break;
      case WeatherCondition.scatteredclouds:
        img = Image.asset('assets/img/imgweather/scatteredclouds.png');
        break;
      case WeatherCondition.brokenclouds:
        img = Image.asset('assets/img/imgweather/brokenclouds.png');
        break;
      // case 'overcast clouds':
      //   condition = Image.asset('assets/img/imgweather/fewclouds.png');
      //   break;
      case WeatherCondition.sun:
        img = Image.asset('assets/img/imgweather/sun.png');
        break;
      
      default:
        img = Image.asset('assets/img/imgweather/brokenclouds.png');
    }

    return Padding(padding: const EdgeInsets.only(top: 5), child: img);
  }


  // mapStringToWeatherConditionToImage(AsyncSnapshot<Current> snapshot) {}
}

// Widget PlatFormInfo(){
//     return 
//     Container(
//       padding: EdgeInsets.only(top: 20),
//       // color: Colors.amber,
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 Row(
//                   children: [ 
//                           Container(
//                             height: 50,
//                             width: 50,
//                             child: Image.asset('assets/img/Layer1.png')),

//                     // Icon( FontAwesomeIcons.cloudSun, size: 40, color: Colors.white),  
//                     Padding(
//                       padding: EdgeInsets.only(left: 25),
//                       child: 
//                         Text('29', style: appStyleText.textStyle14.copyWith(fontSize: 55)),
//                       )
//                     ],
//                 ),

//                 Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Row(
//                         children: [
//                           Icon(Icons.vertical_align_top, color: Colors.white,),
//                           Text('29',style: appStyleText.textStyle14)
//                         ],
//                       ),
//                     ),
                    
//                     Container(
//                       padding: EdgeInsets.only(left: 10, right: 15),
//                       child: Row(
//                         children: [
//                           Icon(Icons.vertical_align_bottom, color: Colors.white,),
//                           Text('23', style: appStyleText.textStyle14)
//                         ],
//                       ),
//                     ),
//                     Text('Cảm giác thực 31', style: TextStyle(color: Colors.white),)
//                   ],
//                 ),

//                 Container(
//                   margin: EdgeInsets.only(top: 15),
//                   child: Text('Nhiều mây', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),))
//               ],
//             )
//           ],
//           ),
//         )
//     );
    
    
    
    
//   }