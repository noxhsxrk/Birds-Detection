import 'package:flutter/material.dart';
import 'package:furniture_app/util/data.dart';
import '../screens/details.dart';

class RoomItem extends StatelessWidget {
  final Map bird;

  RoomItem({this.bird});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details(birdIndex: bird['id']);
              },
            ),
          );
        },
        child: Container(
          height: 300,
          width: 380,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                bird['name'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
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
