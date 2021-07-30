import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/realtime/bounding_box.dart';
import 'package:furniture_app/realtime/camera.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';
import 'package:furniture_app/static_image/static.dart';
import 'package:furniture_app/util/data.dart';
import 'package:furniture_app/screens/details.dart';

class LiveFeed extends StatefulWidget {
  final List<CameraDescription> cameras;
  LiveFeed(this.cameras);
  @override
  _LiveFeedState createState() => _LiveFeedState();
}

class _LiveFeedState extends State<LiveFeed> {
  void check() {
    if (_recognitions[0]['detectedClass'] == "NICOBAR PIGEON") {
      index = 0;
    } else if (_recognitions[0]['detectedClass'] == "PARAKEET") {
      index = 1;
    } else if (_recognitions[0]['detectedClass'] == "PEACOCK") {
      index = 2;
    } else if (_recognitions[0]['detectedClass'] == "HOOPOES") {
      index = 3;
    } else if (_recognitions[0]['detectedClass'] == "GREY PLOVER") {
      index = 4;
    } else if (_recognitions[0]['detectedClass'] == "PELICAN") {
      index = 5;
    } else if (_recognitions[0]['detectedClass'] == "WHIMBREL") {
      index = 6;
    } else if (_recognitions[0]['detectedClass'] == "CANARY") {
      index = 7;
    } else if (_recognitions[0]['detectedClass'] == "GREEN JAVAN MAGPIE") {
      index = 8;
    } else if (_recognitions[0]['detectedClass'] == "BARN OWL") {
      index = 9;
    }

    debugPrint('class : $index');
  }

  route() {
    check();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Details(birdIndex: index)));
  }

  startTimer() {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  initCameras() async {}
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/models/model.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  /* 
  The set recognitions function assigns the values of recognitions, imageHeight and width to the variables defined here as callback
  */
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  void initState() {
    super.initState();
    loadTfModel();
  }

  @override
  Widget build(BuildContext context) {
    if (_recognitions != null) {
      print("asdsadsad");
      startTimer();
    }
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Time Object Detection"),
      ),
      body: Stack(
        children: <Widget>[
          CameraFeed(widget.cameras, setRecognitions),
          BoundingBox(
            _recognitions == null ? [] : _recognitions,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
          ),
        ],
      ),
    );
  }
}
