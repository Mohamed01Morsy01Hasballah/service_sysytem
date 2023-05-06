import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';
import 'package:service_system/modules/HomeTwo.dart';
import 'package:service_system/modules/LoginScreen.dart';
import 'package:service_system/modules/SplashScreen.dart';
import 'Constant/AppTheme.dart';
import 'Constant/Constant.dart';
import 'Package:flutter_localizations/flutter_localizations.dart';
import 'package:hexcolor/hexcolor.dart';

import 'localization/app_localization.dart';
import 'localization/language_constants.dart';
import 'localization/theme_constants.dart';
import 'modules/ChatScreen.dart';
import 'modules/Home.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  static ThemeMode? themeMode;
  static Locale? localeLan;
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
  static void setTheme(BuildContext context, ThemeMode themeMode) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setTheme(themeMode);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  setLocale(Locale locale) {
    setState(() {
      MyApp.localeLan = locale;
    });
  }
  setTheme(ThemeMode themeMode) {
    setState(() {
      MyApp.themeMode = themeMode;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    didChangeDependencies();
  }

  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        MyApp.localeLan = locale;
      });
    });
    getTheme().then((value) {
      setState(() {
        MyApp.themeMode = value;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    if (MyApp.localeLan != null) {
      setState(() {

      });
    }

        return MaterialApp(
          locale: MyApp.localeLan,
          supportedLocales: [
            Locale("en", "US"),
            Locale("ar", "SA"),
          ],
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },

          debugShowCheckedModeBanner: false,
          //#601B92
          theme: ThemeData(
            brightness: Brightness.light,
            backgroundColor: Colors.grey[400]/*Color(0xFFEEFFFA)*/,
            scaffoldBackgroundColor: Colors.grey[300] /*Color(0xFFEEFFFA)*/,
            cardColor: Colors.white,
            shadowColor: Colors.grey,
            accentColor: AppTheme.appColor,
            buttonColor: Colors.black,//                                HexColor('#140529'),
              primaryColor: HexColor('#140529'),
            primarySwatch: Colors.amber,
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color:  HexColor('#140529')
              ),
              bodyText2: TextStyle(
                  color:           HexColor('#140529')

              ),
            )

            /* appBarTheme: AppBarTheme(
            backgroundColor: AppTheme.appColor,
        ),*/
            /*backgroundColor: Colors.white*/
            /* light theme settings */
          ),
          //#140529
          darkTheme: ThemeData(
            textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.white
                ),
              bodyText2: TextStyle(
                  color: defaultColor
              ),

            ),

            brightness: Brightness.dark,
            scaffoldBackgroundColor:  HexColor('#140529'),
            backgroundColor:AppTheme.darkBackground,
            cardColor: HexColor('#061892'),
            accentColor: AppTheme.appColor,
            buttonColor: Colors.white,
            primaryColor: HexColor('#061892'),
            /*appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.darkCard,
          titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white)
        ),*/
            /* dark theme settings */
          ),
          themeMode: MyApp.themeMode,
          home:ChatScreen() ,
        );


  }
}


