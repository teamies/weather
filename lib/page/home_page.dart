
// import 'package:flutter/material.dart';
// import 'package:flutter_app_weather/views/PlatFormInfo.dart';
// import 'package:get/get.dart';

// import '../widgets/day_widget.dart';
// import '../widgets/hourly_widget.dart';
// import '../widgets/province_widget.dart';

// class HomePage extends GetView {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Weather Example App'),),
//       body:ListView(
//         children: [
//           Column(
//             children: const [
//             SizedBox(
//               height: 100,
//               child: Province(),
//             ),
//             //  SizedBox(
//             //   height: 220,
//             //   child: Current(),
//             //   ),
//               SizedBox(
//                 height: 200,
//                 child: Hour(),
//               ),
//               SizedBox(
//                 height: 300,
//                 child: Daily(),
//               )
//             ],
//           ),
//         ],
//       )
//     );
//   }
// }  