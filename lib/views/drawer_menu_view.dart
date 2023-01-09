import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class Menu {
//   final IconData icon;
//   final String Title;
//   const Menu({required this.icon, required this.Title});
// } 


// const List<Menu> menus = const <Menu>[
//   const Menu(icon: Icons.home, Title: "Trang chủ"),
//   const Menu(icon: Icons.map, Title: 'Chỉnh sửa vị trí'),
//   // const Menu(icon: Icons.image, Title: 'Trình thay đổi nền tự động'),
//   const Menu(icon: Icons.settings, Title: 'Cài đặt'),
//   const Menu(icon: Icons.notifications, Title: 'Thông báo'),
//   const Menu(icon: Icons.comment, Title: 'Phản hồi về ứng  dụng Thời tiết'),
//   // const Menu(icon: Icons.mail, Title: 'Báo cáo sự cố'),
//   const Menu(icon: Icons.share, Title: 'Chia sẻ ứng dụng này'),
//   const Menu(icon: Icons.add_to_home_screen_rounded, Title: 'Thêm nhiều ứng dụng'),
//   const Menu(icon: Icons.feedback, Title: 'Phiên bản'),

// ];


class drawerMenu extends StatelessWidget{
  const drawerMenu({super.key});

  //  const drawerMenu({Key? key, required this.menu}) : super(key: key);  
  // final Menu menu;  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // height: 50,
      // color: Color(0xff123EB9),
      child: Column(
        children: [
          Container(
            height: 70,
            child: Row(
              children:
              // <Widget> [
              //   Expanded(flex: 1 ,child: Icon(menu.icon, color: Colors.white,)),
              //   // Spacer(flex: 1,),
              //   Expanded(flex: 4 ,child: Text(menu.Title, style: appStyleText.textStyle14,),)
              //       ],
              [
                Expanded(flex: 1, child: Icon(Icons.home, color: Colors.white)),
                Expanded(flex: 4, child: Text("Trang chủ",style: appStyleText.textStyle18))
              ]
              
            ),
          ),
          Container(
            height: 70,
            child: Row(
              children:
              [
                Expanded(flex: 1, child: Icon(Icons.map, color: Colors.white)),
                Expanded(flex: 4, child: Text("Chỉnh sửa vị trí",style: appStyleText.textStyle18))
              ]
            ),
          ),
          Container(
            height: 70,
            child: Row(
              children:
              [
                Expanded(flex: 1, child: Icon(Icons.settings, color: Colors.white)),
                Expanded(flex: 4, child: Text("Cài đặt",style: appStyleText.textStyle18))
              ]
            ),
          ),
          Container(
            height: 70,
            child: Row(
              children:
              [
                Expanded(flex: 1, child: Icon(Icons.notifications, color: Colors.white)),
                Expanded(flex: 4, child: Text("Thông báo",style: appStyleText.textStyle18))
              ]
            ),
          ),
          Container(
            height: 70,
            child: Row(
              children:
              [
                Expanded(flex: 1, child: Icon(Icons.feedback, color: Colors.white)),
                Expanded(flex: 4, child: Text("Phiên bản",style: appStyleText.textStyle18))
              ]
            ),
          ),
        ],
      ),
    );
  }

}