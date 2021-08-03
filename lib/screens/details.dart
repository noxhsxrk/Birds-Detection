import 'package:flutter/material.dart';

import 'package:birds_detection/screens/main_screen.dart';
import 'package:birds_detection/util/data.dart';

class Details extends StatefulWidget {
  final int birdIndex;
  final String pageIndex;
  @override
  _DetailsState createState() =>
      _DetailsState(birdIndex: birdIndex, pageIndex: pageIndex);
  Details({this.birdIndex, this.pageIndex});
}

class _DetailsState extends State<Details> {
  int selectedPage = 0;
  int birdIndex;
  String pageIndex;
  _DetailsState({this.birdIndex, this.pageIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              SizedBox(height: 40.0),
              buildImage(),
              SizedBox(height: 20.0),
              Text(
                "${birds[birdIndex]["name"]}",
                style: TextStyle(
                  fontFamily: 'Mitr',
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "${birdsData[birdIndex]["name_eng"]}",
                style: TextStyle(
                  fontFamily: 'Mitr',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 470),
            height: 500,
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30),
              children: <Widget>[
                Text(
                  "ลักษณะเด่น",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "         ${birdsData[birdIndex]["interesting_in"]}",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 18.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.0),
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),
                Text(
                  "ที่อยู่อาศัย",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "         ${birdsData[birdIndex]["habitat"]}",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 18.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 20.0),
                Text(
                  "อาหาร",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "         ${birdsData[birdIndex]["food"]}",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 18.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "พฤติกรรม",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),
                Text(
                  "         ${birdsData[birdIndex]["habitat"]}",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 18.0,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Photos",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 200.0),

                //buildProductList(),
              ],
            ),
          ),
          Center(
              child: Align(
            alignment: FractionalOffset(0.5, 0.95),
            child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(pageIndex: pageIndex)));
                },
                label: Text(
                  "ย้อนกลับ",
                  style: TextStyle(
                    fontFamily: 'Mitr',
                    fontSize: 30,
                  ),
                )),
          ))
        ],
      ),
    );
  }

  // buildProductList() {
  //   return Container(
  //     height: 100.0,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       shrinkWrap: true,
  //       itemCount: birds.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Map bird = birds.reversed.toList()[index];
  //         return ProductItem(
  //           bird: bird,
  //         );
  //       },
  //     ),
  //   );
  // }

  buildImage() {
    return Container(
      height: 320.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "${birds[birdIndex]["img"]}",
              height: 320.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
