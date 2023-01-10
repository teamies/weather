import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool status1 = false;
  TextEditingController timeinput = TextEditingController(); 
  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
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

          child: ListView(
            children: [
              Column(
                children: [Notification(), notificationState(), TimePicker()],
              ),
            ],
          ),
        ));
  }

  Widget Notification() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              "Bật thông báo",
              style: appStyleText.textStyle18,
            ),
          ),
          FlutterSwitch(
            width: 55,
            height: 30,
            value: status1,
            onToggle: (bool val) {
              setState(() {
                status1 = val;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget notificationState() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.only( top: 30),
          child: Text(
            "Thông báo hàng ngày",
            style: appStyleText.textStyle18,
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.only(bottom: 20, top: 15),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.white))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  "Buổi sáng",
                  style: appStyleText.textStyle18,
                ),
              ),
              FlutterSwitch(
                width: 55,
                height: 30,
                value: status1,
                onToggle: (bool val) {
                  setState(() {
                    status1 = val;
                  });
                },
              ),
            ],
          ),
        ),



        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.only(bottom: 20, top: 15),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.white))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  "Buổi trưa",
                  style: appStyleText.textStyle18,
                ),
              ),
              FlutterSwitch(
                width: 55,
                height: 30,
                value: status1,
                onToggle: (bool val) {
                  setState(() {
                    status1 = val;
                  });
                },
              ),
            ],
          ),
        ),



        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.only(bottom: 20, top: 15),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.white))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  "Buổi tối",
                  style: appStyleText.textStyle18,
                ),
              ),
              FlutterSwitch(
                width: 55,
                height: 30,
                value: status1,
                onToggle: (bool val) {
                  setState(() {
                    status1 = val;
                  });
                },
              ),
            ],
          ),
        ),

        settingTimeNotification()
      ],
    );
  }


  Widget settingTimeNotification() {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.only(bottom: 20, top: 20),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              "Bật thông báo",
              style: appStyleText.textStyle18,
            ),
          ),
          FlutterSwitch(
            width: 55,
            height: 30,
            value: status1,
            onToggle: (bool val) {
              setState(() {
                status1 = val;
              });
            },
          ),
        ],
      ),
    );
  }

Widget TimePicker(){
  return Container(
          padding: EdgeInsets.all(15),
          height:150,
          child:Center( 
             child:TextField(
                controller: timeinput, 
                decoration: InputDecoration( 
                   icon: Icon(Icons.timer), 
                   labelText: "Enter Time" 
                ),
                readOnly: true, 
                onTap: () async {
                  TimeOfDay? pickedTime =  await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                      );
                  
                  if(pickedTime != null ){
                      print(pickedTime.format(context));   
                      DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                      print(parsedTime);
                      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                      // print(formattedTime); 
                      setState(() {
                        timeinput.text = formattedTime; 
                      });
                  }else{
                      print("Time is not selected");
                  }
                },
             )
          )
    );
} 

}
