import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../localization/language_constants.dart';
import '../../main.dart';

class LanguageScreen extends StatefulWidget{
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _lan=MyApp.localeLan!.languageCode;
  void _changeLanguage(String languageCode) async {
    Locale _locale = await setLocale(languageCode);
    MyApp.setLocale(context, _locale);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'language')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(getTranslated(context, 'english')),
            leading: Radio(
              value: "en",
              groupValue: _lan,
              onChanged: (String? value) {
                setState(() {
                  _changeLanguage(value!) ;
                  _lan= value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(getTranslated(context, 'arabic')),
            leading: Radio(
              value: "ar",
              groupValue: _lan,
              onChanged: (String ?value) {
                setState(() {
                  _changeLanguage(value!) ;
                  _lan= value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

}