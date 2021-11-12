import 'dart:async';

import 'package:flutter/material.dart';
import 'package:birds_detection/screens/main_screen.dart';
import 'package:birds_detection/util/const.dart';
import 'package:camera/camera.dart';
import 'package:birds_detection/screens/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<CameraDescription> cameras;
bool introPageStat;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  getBoolVal();
  runApp(MyApp());
}

void getBoolVal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('introPageStat')) {
    introPageStat = prefs.getBool('introPageStat') ?? 0;
  } else {
    introPageStat = true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(introPageStat);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: introPageStat ? OnboardingPage() : MainScreen(),
    );
  }
}
