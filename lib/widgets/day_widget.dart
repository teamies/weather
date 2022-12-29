import 'package:flutter/material.dart';
import 'package:flutter_app_weather/Models/day_model.dart';
import 'package:flutter_app_weather/controller/day_controller.dart';
import 'package:get/get.dart';

class DailyView extends StatefulWidget {
  @override
  State<DailyView> createState() => _DailyViewState();
}

class _DailyViewState extends State<DailyView> {
  // const Daily({super.key});
  num? temp;
  late DailyController _daily;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _daily = new DailyController();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future:  _daily.get_daily(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                // print(index);
                temp = snapshot.data![index].temp!.day;
                print('aa');
                print(temp);
                return Container();
                // if(index != 2){
                // return Column(
                //   children: [
                //     Text(index.toString()+ ':'+snapshot.data![index].temp!.day.toString()),
                //     Text(index.toString()+ ':'+snapshot.data![index].temp!.night.toString()),
                //     Text(index.toString()+ ':'+snapshot.data![index].temp!.max.toString())
                //   ],
                // );
                // }
                // return SizedBox();
                
              },);
            } else {
              
            return LinearProgressIndicator();
            }
        },);
    
  }

 

}