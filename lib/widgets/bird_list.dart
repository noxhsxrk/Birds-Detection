import 'package:flutter/material.dart';
import 'package:birds_detection/util/data.dart';
import '../screens/details.dart';

class BirdsList extends StatelessWidget {
  final Map bird;

  BirdsList({this.bird});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details(birdIndex: bird['id'], pageIndex: "home");
              },
            ),
          );
        },
        child: Container(
          height: 300,
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                bird['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: bird['name'] == "นกกะรางหัวขวาน" ? 15 : 20,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "${bird["img"]}",
                  height: 240,
                  width: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
