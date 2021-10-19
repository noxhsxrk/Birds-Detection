import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:birds_detection/screens/details.dart';

class BoundingBox extends StatelessWidget {
  final List<dynamic> results;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  int index;

  BoundingBox(
    this.results,
    this.previewH,
    this.previewW,
    this.screenH,
    this.screenW,
  );

  @override
  Widget build(BuildContext context) {
    void check(detectclass) {
      if (detectclass == "NICOBAR PIGEON") {
        index = 0;
      } else if (detectclass == "PARAKEET") {
        index = 1;
      } else if (detectclass == "PEACOCK") {
        index = 2;
      } else if (detectclass == "HOOPOES") {
        index = 3;
      } else if (detectclass == "GREY PLOVER") {
        index = 4;
      } else if (detectclass == "PELICAN") {
        index = 5;
      } else if (detectclass == "WHIMBREL") {
        index = 6;
      } else if (detectclass == "CANARY") {
        index = 7;
      } else if (detectclass == "GREEN JAVAN MAGPIE") {
        index = 8;
      } else if (detectclass == "BARN OWL") {
        index = 9;
      }
    }

    route(detectclass) async {
      check(detectclass);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Details(
                    birdIndex: index,
                    pageIndex: "live",
                  )));
    }

    List<Widget> _renderBox() {
      return results.map((re) {
        var _x = re["rect"]["x"];
        var _w = re["rect"]["w"];
        var _y = re["rect"]["y"];
        var _h = re["rect"]["h"];
        var scaleW, scaleH, x, y, w, h;

        if (screenH / screenW > previewH / previewW) {
          scaleW = screenH / previewH * previewW;
          scaleH = screenH;
          var difW = (scaleW - screenW) / scaleW;
          x = (_x - difW / 2) * scaleW;
          w = _w * scaleW;
          if (_x < difW / 2) w -= (difW / 2 - _x) * scaleW;
          y = _y * scaleH;
          h = _h * scaleH;
        } else {
          scaleH = screenW / previewW * previewH;
          scaleW = screenW;
          var difH = (scaleH - screenH) / scaleH;
          x = _x * scaleW;
          w = _w * scaleW;
          y = (_y - difH / 2) * scaleH;
          h = _h * scaleH;
          if (_y < difH / 2) h -= (difH / 2 - _y) * scaleH;
        }

        return Positioned(
            left: math.max(0, x),
            top: math.max(0, y - 75),
            width: w,
            height: h,
            child: Container(
              padding: EdgeInsets.only(top: 5.0, left: 5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(37, 213, 253, 1.0),
                  width: 3.0,
                ),
              ),
              child: InkWell(
                onTap: () {
                  route(re["detectedClass"]);
                },
                child: Text(
                  "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    color: Color.fromRGBO(37, 213, 253, 1.0),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ));
      }).toList();
    }

    return Stack(
      children: _renderBox(),
    );
  }
}
