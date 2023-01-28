import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/get_navigation.dart';

class searchView extends StatefulWidget {
  const searchView({super.key});

  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 7,
            child: Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.blue, width: 2) )),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(Icons.search)
                  ),
                  Expanded(
                    flex: 7,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        // enabledBorder: UnderlineInputBorder(
                        //           borderSide:
                        //               BorderSide(width: 2, color: Colors.blue),
                        //         ),
                        hintText: 'Tìm kiếm',
                      ),
                      // controller: _controller,
                      onSubmitted: (String value) {
                        debugPrint(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          TextButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text("Hủy", style: TextStyle(fontSize: 18, ),)
            ),
        ],
      ),
    );
  }
}
