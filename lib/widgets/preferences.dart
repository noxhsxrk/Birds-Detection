import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserPreferences {
  static SharedPreferences _preferences;

  static const _introPage = "true";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setIntroPageStat(String introPage) async =>
      await _preferences.setString(_introPage, introPage);

  static String getIntroPageStat() => _preferences.getString(_introPage);
}
