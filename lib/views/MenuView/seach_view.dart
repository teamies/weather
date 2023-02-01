import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_weather/controller/province_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:search_page/search_page.dart';

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
                        hintText: 'Tìm kiếm',
                      ),
                      // controller: _controller,
                      onSubmitted: (value) => ProvineController() 
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


class Person implements Comparable<Person> {
  final String name;

  const Person(this.name);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}   


class searchView1 extends StatefulWidget {
  const searchView1({super.key});

  @override
  State<searchView1> createState() => _searchViewState1();
}

class _searchViewState1 extends State<searchView1> {

    static const people = [
    Person('Mike'),
    Person('Todd'),
    Person('Ahmad'),
    Person('Anthony'),
    Person('Annette'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: 
      
      
      
      IconButton(
        onPressed: (){
          showSearch(
          context: context,
          delegate: SearchPage(
            onQueryUpdate: print,
            items: people,
            searchLabel: 'Search people',
            suggestion: const Center(
              child: Text('Filter people by name, surname or age'),
            ),
            failure: const Center(
              child: Text('No person found :('),
            ),
            filter: (person) => [
              person.name
            ],
            sort: (a, b) => a.compareTo(b),
            builder: (person) => ListTile(
              title: Text(person.name),
            ),
          ),
        );
        }, 
        icon: Icon(Icons.search))
    );
  }
}
