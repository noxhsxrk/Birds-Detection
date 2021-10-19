import 'dart:convert';

import 'package:birds_detection/widgets/preferences.dart';
import 'package:flutter/material.dart';
import 'package:birds_detection/screens/main_screen.dart';
import 'package:birds_detection/util/const.dart';
import 'package:camera/camera.dart';
import 'package:birds_detection/screens/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await UserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String pageStat = UserPreferences.getIntroPageStat();
  @override
  Widget build(BuildContext context) {
    if (pageStat == null) {
      pageStat = "true";
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      theme: Constants.lightTheme,
      darkTheme: Constants.darkTheme,
      home: pageStat == "true" ? OnboardingPage() : MainScreen(),
    );
  }
}
