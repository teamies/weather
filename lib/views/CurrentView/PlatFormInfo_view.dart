import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Models/current_model.dart';
import '../../Models/weather_model.dart';
import '../../controller/current_controller.dart';
import '../../widgets/mapStringToWeatherConditionToImage.dart';

class PlatFormInfo extends StatefulWidget {
  @override
  State<PlatFormInfo> createState() => _PlatFormInfoState();
}

class _PlatFormInfoState extends State<PlatFormInfo> {
  // const Daily({super.key});
  late CurrentController _current;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _current = new CurrentController();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: _current.getCurrent(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return 
          Container(
            height: 220,
            padding: EdgeInsets.only(top: 20, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Container(
                    height: 70,
                    width:  70,
                    child: 
                    mapStringToWeatherConditionToImage(snapshot.data!.hourly![0].weather![0].condition)
                    // Text(snapshot.data!.hourly![0].weather![0].condition.toString())

                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: 
                      Text(
                        "${snapshot.data!.current!.temp?.toStringAsFixed(0)}\u00B0", 
                        style: appStyleText.textStyle14.copyWith(fontSize: 55)),
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
                          "${snapshot.data!.daily![0].temp!.max?.toStringAsFixed(0)}\u00B0", 
                          style: appStyleText.textStyle18),
                      ],
                    ),
                  ),
                    
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 15),
                    child: Row(
                      children: [
                        Icon(Icons.vertical_align_bottom, color: Colors.white,),
                        Text(
                          "${snapshot.data!.daily![0].temp!.min?.toStringAsFixed(0)}\u00B0", 
                          style: appStyleText.textStyle18),
                      ],
                    ),
                  ),
                    
                  Text(
                    "Cảm giác thực ${snapshot.data!.current!.feelsLike!.toStringAsFixed(0)}\u00B0",  
                     style: appStyleText.textStyle18,
                  )
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  snapshot.data!.hourly![0].weather![0].description.toString(),
                  style: appStyleText.textStyle24b,
                )
              ),
              ],
            ),
          );
        } else {
            return LinearProgressIndicator();
          }
      },
    );
  }
}

