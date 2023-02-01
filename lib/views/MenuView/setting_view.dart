import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_app_weather/chart/temperatureChart.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter_app_weather/myHomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/src/widgets/framework.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff123EB9),leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back_outlined)) ,
          title: Center(
            child: Column(
              children: [
                Text('Cài đặt đơn vị',
                    style: appStyleText.textStyle20
                        .copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          // color: Colors.blue.shade200,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xff123EB9),
                Color(0xFF42A5F5),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: Column(
            children: [temperature(), rain(), windspeed(), pressure(),
              Container(
                margin: EdgeInsets.only(top: 150),
                child: TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '',)));
                  }, 
                  // ignore: sort_child_properties_last
                  child: Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 40, right: 40),
                    child: const Text('OK', style: appStyleText.textStyle24b,)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                    backgroundColor:  MaterialStateProperty.all<Color>(Color.fromARGB(255, 2, 16, 97)),),
                ),
              )
            ],
            ),
        ));
  }

  Widget temperature() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.only(right: 15),
                  child: FaIcon(
                    FontAwesomeIcons.temperatureLow,
                    size: 30,
                    color: Colors.white,
                  )),
              Text(
                'Nhiệt độ',
                style: appStyleText.textStyle18,
              )
            ],
          ),
          AnimatedButtonBar(
            radius: 8.0,
            padding: const EdgeInsets.all(16.0),
            innerVerticalPadding: 7,
            invertedSelection: true,
            backgroundColor: Color.fromARGB(255, 16, 4, 59).withOpacity(0.6),
            foregroundColor: Colors.white,
            children: [
              ButtonBarEntry(
                  onTap: () => print('First item tapped'),
                  child: const Text(
                    'F',
                    style: appStyleText.textStyle18b,
                  )),
              ButtonBarEntry(
                  onTap: () => print('Second item tapped'),
                  child: const Text(
                    'C',
                    style: appStyleText.textStyle18b,
                  )),
            ],
          ),

          // ListTile(
          //   title: Text('data'),
          //   isThreeLine: true,
          //   subtitle: Text(SettingsState.temperatureUnit == TemperatureUnit.Celsius ? 'celsius' :'fahrenheit'),
          //   trailing: Switch(
          //     value: SettingsState.temperatureUnit == TemperatureUnit.Celsius, 
          //     onChanged: onChanged),
          // )
        ],
      ),
    );
  }

  Widget rain() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              // Image.asset('assets/img/imgweather/temp.png',width: 40,height: 40,),
              Container(
                  padding: EdgeInsets.only(right: 15),
                  child: FaIcon(
                    FontAwesomeIcons.cloudRain,
                    size: 30,
                    color: Colors.white,
                  )),
              Text(
                'Lượng mưa',
                style: appStyleText.textStyle18,
              )
            ],
          ),
          AnimatedButtonBar(
            radius: 8.0,
            padding: const EdgeInsets.all(16.0),
            innerVerticalPadding: 7,
            invertedSelection: true,
            backgroundColor: Color.fromARGB(255, 16, 4, 59).withOpacity(0.6),
            foregroundColor: Colors.white,
            children: [
              ButtonBarEntry(
                  onTap: () => print('First item tapped'),
                  child: Text(
                    'mm',
                    style: appStyleText.textStyle18b,
                  )),
              ButtonBarEntry(
                  onTap: () => print('Second item tapped'),
                  child: Text(
                    'in',
                    style: appStyleText.textStyle18b,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget windspeed() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              // Image.asset('assets/img/imgweather/temp.png',width: 40,height: 40,),
              Container(
                  padding: EdgeInsets.only(right: 15),
                  child: FaIcon(
                    FontAwesomeIcons.wind,
                    size: 30,
                    color: Colors.white,
                  )),
              Text(
                'Tốc độ gió',
                style: appStyleText.textStyle18,
              )
            ],
          ),
          AnimatedButtonBar(
            radius: 8.0,
            padding: const EdgeInsets.all(16.0),
            innerVerticalPadding: 7,
            invertedSelection: true,
            backgroundColor: Color.fromARGB(255, 16, 4, 59).withOpacity(0.6),
            foregroundColor: Colors.white,
            children: [
              ButtonBarEntry(
                  onTap: () => print('First item tapped'),
                  child: Text(
                    'km/h',
                    style: appStyleText.textStyle18b,
                  )),
              ButtonBarEntry(
                  onTap: () => print('Second item tapped'),
                  child: Text(
                    'm/s',
                    style: appStyleText.textStyle18b,
                  )),
            ],
          ),
        ],
      ),
    );
  }


  Widget pressure() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              // Image.asset('assets/img/imgweather/temp.png',width: 40,height: 40,),
              Container(
                padding: EdgeInsets.only(right: 15),
                child:                   
                  Icon(Icons.disabled_visible_outlined, size: 30, color: Colors.white,),
              ),
              Text(
                'Áp suất',
                style: appStyleText.textStyle18,
              )
            ],
          ),
          AnimatedButtonBar(
            radius: 8.0,
            padding: const EdgeInsets.all(16.0),
            innerVerticalPadding: 7,
            invertedSelection: true,
            backgroundColor: Color.fromARGB(255, 16, 4, 59).withOpacity(0.6),
            foregroundColor: Colors.white,
            children: [
              ButtonBarEntry(
                  onTap: () => print('First item tapped'),
                  child: Text(
                    'mmHg',
                    style: appStyleText.textStyle18b,
                  )),
              ButtonBarEntry(
                  onTap: () => print('Second item tapped'),
                  child: Text(
                    'hPa',
                    style: appStyleText.textStyle18b,
                  )),
              ButtonBarEntry(
                  onTap: () => print('third item tapped'),
                  child: Text(
                    'mba',
                    style: appStyleText.textStyle18b,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
