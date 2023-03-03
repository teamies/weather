import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_weather/Models/Location.dart';
import 'package:flutter_app_weather/config/textstyle.dart';
import 'package:flutter_app_weather/controller/province_controller.dart';
import 'package:flutter_app_weather/controller/search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:search_page/search_page.dart';

class searchView extends StatefulWidget {
  const searchView({super.key});

  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {
  final _formKey = GlobalKey<FormState>();
  late String _query;
  late Search _search;
  late String _results = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _search = new Search();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                    margin: EdgeInsets.only(top: 15, left: 15),
          child: Column(
        children: [
          Form(
            key: _formKey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      // border: Border(bottom: BorderSide(color: Colors.blue, width: 2) )
                      // border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color:Color.fromARGB(255, 174, 174, 175).withOpacity(0.3),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1, 
                          child: Icon(Icons.search, color: Color.fromARGB(255, 109, 109, 109))),
                        Expanded(
                          flex: 7,
                          child: TextFormField(
                            decoration: InputDecoration(
                              // labelText: 'Tìm kiếm',
                              hintText: 'Tìm kiếm',
                              hintStyle: appStyleText.textStyle18black.copyWith(color: Color.fromARGB(255, 109, 109, 109)),
                              border: InputBorder.none,
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            style: appStyleText.textStyle18black,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return 'Vui lòng nhập vào nội dung tìm kiếm';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (value.length > 3)
                                setState(() {
                                  _results = value;
                                });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Hủy",
                      style: TextStyle(
                        fontSize: 18,
                        decoration: TextDecoration.underline 
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder<dynamic>(
            future: _search.getName(_results),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 25),
                        child: Text(
                          snapshot.data[index].name,
                          style: appStyleText.textStyle18black,
                        ),
                      );
                    },
                  );
                }
                return LinearProgressIndicator();
              } else {
                return LinearProgressIndicator();
              }
            },
          )),
        ],
      )),
    );
  }
}
