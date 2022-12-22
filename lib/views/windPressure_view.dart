// // import 'dart:html';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app_weather/config/textstyle.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// import '../controller/day_controller.dart';




// class windPressure extends GetView<DayController> {
//   const windPressure({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  FutureBuilder(
//       future: controller.getDaily(),
//       builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         // Widget windPressure(){
//         return  Column(
//           children: [
//             Container(
//               height: 40,
//               decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Colors.white))),
//               child: Row(
//                 children: [
//                   Text('Gió và áp suất', style: appStyleText.textStyle14,)
//                 ],
//               ),
//             ),

//             Container(
//               height: 100,
//               padding: EdgeInsets.only(top: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(FontAwesomeIcons.wind,size: 100,color: Colors.white,),
                  
//                   Column(
//                     children: [
//                       Text(' hướng bắc', style: appStyleText.textStyle14,),
//                       // windCheck(),
//                       Text('data'),
//                       // Text('data',style: appStyleText.textStyle14,),
//                       Text('wind_deg: ${snapshot.data!.windDeg}'),
//                       ],
                      
//                   ),
//                   Spacer(flex: 1,),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(' Áp suất', style: appStyleText.textStyle14,),
//                       Text('${snapshot.data!.pressure} \hPa',style: appStyleText.textStyle14,)
//                       ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         );
//       } else {
//           return LinearProgressIndicator();
//         }
//       },
//     );
//   }
// }


// // Widget windCheck(){
// //   if(0<= pressure <=90 ){}
// // return Text('data');
// // }

// class windCheck extends GetView<DayController> {
//   const windCheck({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  FutureBuilder(
//       future: controller.getDaily(),
//       builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         var windDeg2 = snapshot.data?.windDeg;
//         // var t = 0;
//         switch(windDeg2) {
//             case 0: windDeg2! == 0 && windDeg2 == 360; 
//               Text('Bắc');
//             break;

//             case 1: 0 < windDeg2! && windDeg2 <= 22.5;
//               Text('Bắc đông bắc');
//             break;

//             case 2:  22.5 < windDeg2! && windDeg2 <= 67.5;
//               Text('Đông bắc');
//             break;

//             case 3: 67.5 < windDeg2! && windDeg2 < 90 ;
//               Text('Đông đông bắc');
//             break;

//             case 4:  90 == windDeg2;
//               Text('Đông');
//             break;

//             case 5: 90 < windDeg2! && windDeg2 <= 112.5;
//               Text('Đông đông nam');
//             break;

//             case 6: 112.5 < windDeg2! && windDeg2 <= 157.5;
//               Text('Đông nam');
//             break;

//             case 7: 157.5 < windDeg2! && windDeg2 < 180 ;
//               Text('Nam đông nam');
//             break;

//             case 8: 180 == windDeg2 ;
//               Text('Nam');
//             break;

//             case 9: 180 < windDeg2! && windDeg2 <= 202.5;
//               Text('Nam tây nam');
//             break;

//             case 10: 202.5 < windDeg2! && windDeg2 <= 247.5 ;
//               Text('Tây nam');
//             break;

//             case 11: 247.5 < windDeg2! && windDeg2 < 270 ;
//               Text('Tây tây nam');
//             break;

//             case 12: 270 == windDeg2 ;
//               Text('Tây ');
//             break;

//             case 13:  270 < windDeg2! && windDeg2 <= 292.5 ;
//               Text('Tây tây bắc');
//             break;
            
//             case 14: 292.5 < windDeg2! && windDeg2 <= 337.5 ;
//               Text('Tây bắc');
//             break;

//             case 15: 337.5 < windDeg2! && windDeg2 < 360 ;
//               Text('Bắc tây bắc');
//             break;

//             }

            
//         return windCheck();
//         // if( windDeg2! == 0 && windDeg2 == 360 ){
//         //   Text('Bắc');
//         // }else if( 0 < windDeg2 && windDeg2 <= 22.5 ){
//         //   Text('Bắc đông bắc');
//         // }else if( 22.5 < windDeg2 && windDeg2 <= 67.5 ){
//         //   Text('Đông bắc');
//         // }else if(67.5 < windDeg2 && windDeg2 < 90 ){
//         //   Text('Đông đông bắc');
//         // }else if( 90 == windDeg2 ){
//         //   Text('Đông');
//         // }else if( 90 < windDeg2 && windDeg2 <= 112.5 ){
//         //   Text('Đông đông nam');
//         // }else if( 112.5 < windDeg2 && windDeg2 <= 157.5 ){
//         //   Text('Đông nam');
//         // }else if( 157.5 < windDeg2 && windDeg2 < 180 ){
//         //   Text('Nam đông nam');
//         // }else if( 180 == windDeg2 ){
//         //   Text('Nam');
//         // }else if( 180 < windDeg2 && windDeg2 <= 202.5 ){
//         //   Text('Nam tây nam');
//         // }else if( 202.5 < windDeg2 && windDeg2 <= 247.5 ){
//         //   Text('Tây nam');
//         // }else if( 247.5 < windDeg2 && windDeg2 < 270 ){
//         //   Text('Tây tây nam');
//         // }else if( 270 == windDeg2 ){
//         //   Text('Tây ');
//         // }else if( 270 < windDeg2 && windDeg2 <= 292.5 ){
//         //   Text('Tây tây bắc');
//         // }else if( 292.5 < windDeg2 && windDeg2 <= 337.5 ){
//         //   Text('Tây bắc');
//         // }else if( 337.5 < windDeg2 && windDeg2 < 360 ){
//         //   Text('Bắc tây bắc');
//         // }
//         // return windCheck();
//         // }
//       } else {
//           return LinearProgressIndicator();
//         }
//       }
//     );
//   }
// }