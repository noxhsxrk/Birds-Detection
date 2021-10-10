import 'package:flutter/material.dart';

import 'package:birds_detection/util/data.dart';

import 'package:birds_detection/widgets/bird_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 30.0),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              "รายชื่อนก",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(height: 30.0),
          buildList(screenHeight, screenWidth),
        ],
      ),
    );
  }

  buildList(screenH, screenW) {
    print(screenH);
    return Container(
      height: 800,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 300,
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: birds.length,
        itemBuilder: (BuildContext context, int index) {
          Map bird = birds[index];
          return BirdsList(
            bird: bird,
          );
        },
      ),
    );
  }
}
