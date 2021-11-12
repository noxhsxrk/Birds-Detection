import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:birds_detection/screens/home.dart';
import 'package:birds_detection/static_image/static.dart';
import 'package:birds_detection/realtime/live_camera.dart';
import 'package:birds_detection/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  final String pageIndex;
  @override
  _MainScreenState createState() => _MainScreenState(pageIndex: pageIndex);
  MainScreen({this.pageIndex});
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  String pageIndex;
  _MainScreenState({this.pageIndex});

  final List<Widget> _children = [Home(), LiveFeed(cameras), StaticImage()];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
      pageIndex = null;
    });
  }

  bool introPageStat;
  @override
  Widget build(BuildContext context) {
    addBooleanValue();
    getBoolVal();

    if (pageIndex == "home") {
      _currentIndex = 0;
    } else if (pageIndex == "live") {
      _currentIndex = 1;
    } else if (pageIndex == "static") {
      _currentIndex = 2;
    }
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Feather.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.camera,
              ),
              label: "Camera",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.folder_plus,
              ),
              label: "Pick an Image",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addBooleanValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('introPageStat', false);
  }

  void getBoolVal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool pageStat = prefs.getBool('introPageStat') ?? false;
    introPageStat = pageStat;
  }
}
