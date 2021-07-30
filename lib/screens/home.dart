import 'package:flutter/material.dart';

import 'package:furniture_app/util/data.dart';

import 'package:furniture_app/widgets/room_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          SizedBox(width: 20.0),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
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
          buildList(),
          //SizedBox(height: 20.0),
        ],
      ),
    );
  }

  buildList() {
    return Container(
      height: 600,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: birds.length,
        itemBuilder: (BuildContext context, int index) {
          Map bird = birds[index];
          return RoomItem(
            bird: bird,
          );
        },
      ),
    );
  }
}
