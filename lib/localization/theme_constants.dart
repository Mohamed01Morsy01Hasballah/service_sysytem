import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String THEME_CODE = 'themeCode';
const String THEME_DARK = 'ThemeMode.dark';
const String THEME_LIGHT = 'ThemeMode.light';
const String THEME_SYSTEM = 'ThemeMode.system';


Future<ThemeMode> setTheme(String themeMode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(THEME_CODE, themeMode);
  return _themeMode(themeMode);
}
Future<ThemeMode> getTheme() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String themeMode = _prefs.getString(THEME_CODE) ?? THEME_SYSTEM;
  return _themeMode(themeMode);
}

ThemeMode _themeMode(String themeMode) {
  switch (themeMode) {
    case THEME_DARK:
      return ThemeMode.dark;
    case THEME_LIGHT:
      return ThemeMode.light;
    case THEME_SYSTEM:
      return ThemeMode.system;
    default:
      return ThemeMode.system;
  }
}