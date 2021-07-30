import 'package:flutter/material.dart';

import '../screens/details.dart';

class ProductItem extends StatelessWidget {
  final Map bird;

  ProductItem({this.bird});

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
          height: 140,
          width: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "${bird["img"]}",
              height: 140,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
