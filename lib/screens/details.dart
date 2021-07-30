import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:furniture_app/util/data.dart';
import 'package:furniture_app/widgets/product_item.dart';

class Details extends StatefulWidget {
  final int birdIndex;
  @override
  _DetailsState createState() => _DetailsState(birdIndex: birdIndex);
  Details({this.birdIndex});
}

class _DetailsState extends State<Details> {
  int selectedPage = 0;
  int birdIndex;
  _DetailsState({this.birdIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 80.0),
              buildImage(),
              SizedBox(height: 20.0),
              Text(
                "${birds[birdIndex]["name"]}",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              Text(
                "\TEXT",
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "ข้อมูลนก",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Sed porttitor lectus nibh. Cras ultricies ligula "
                "sed magna dictum porta. Praesent sapien massa, "
                "convallis a pellentesque nec, egestas non nisi. "
                "Lorem ipsum dolor sit amet, consectetur adipiscing "
                "elit. Nulla porttitor accumsan tincidunt. "
                "Curabitur arcu erat, accumsan id imperdiet et, "
                "porttitor at sem.",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Photos",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              //buildProductList(),
            ],
          ),
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
      height: 240.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "${birds[birdIndex]["img"]}",
              height: 240.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
