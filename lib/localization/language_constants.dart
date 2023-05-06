import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localization.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String ARABIC = 'ar';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}
Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? Platform.localeName.substring(0,2);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case ARABIC:
      return Locale(ARABIC, "SA");
    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  return AppLocalization.of(context)!.translate(key);
}

