import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../localization/language_constants.dart';
import '../../localization/theme_constants.dart';
import '../../main.dart';
class DarkModeScreen extends StatefulWidget{
  @override
  _DarkModeScreenState createState() => _DarkModeScreenState();
}

class _DarkModeScreenState extends State<DarkModeScreen> {
  ThemeMode _mode = MyApp.themeMode!;
  void _changeTheme(ThemeMode themeMode) async {
    ThemeMode _locale = await setTheme(themeMode.toString());
    MyApp.setTheme(context, themeMode);
  }
  @override
  Widget build(BuildContext context) {
    /*MyApp.themeMode = _mode;*/
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'dark_mode')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(getTranslated(context, 'dark')),
            leading: Radio(
              value: ThemeMode.dark,
              groupValue: _mode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _changeTheme(value!) ;
                  _mode= value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(getTranslated(context, 'light')),
            leading: Radio(
              value: ThemeMode.light,
              groupValue: _mode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _changeTheme(value!);
                  _mode= value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(getTranslated(context, 'use_system_setting')),
            leading: Radio(
              value: ThemeMode.system,
              groupValue: _mode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _changeTheme(value!);
                  _mode= value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

}