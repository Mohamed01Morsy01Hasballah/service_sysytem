import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:service_system/modules/LoginScreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController? controller;
  CurvedAnimation? curve;
  double moveTop = 1000;
  double moveBottom = 0;
  double moveRight = 0;
  double moveLeft = -500;

  /*startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }*/

  void navigationPage() {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    // startTime();
    /*controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    controller.forward();
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);*/
    Future.delayed(Duration(seconds: 2), () async {
      navigationPage();
      /* setState(() {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
      });*/
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height ;
    double width = MediaQuery.of(context).size.width;
    Future.delayed(
      Duration(seconds: 0),
          () async {
        setState(() {
          moveLeft = width * 0.15;
          moveRight = width * 0.15;
        });
      },
    );
    Future.delayed(
      Duration(milliseconds: 0),
          () async {
        setState(() {
          moveTop = 0;
          moveBottom = height*0.1;
        });
      },
    );
    /* return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
          body:  FadeTransition(
            opacity: curve,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[new Image.asset('assets/images/gallery.png')],
            ),
          ),
        ),
    );
  }*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 1500),
              top: moveTop,
              bottom: moveBottom,
              left: 0,
              right: 0,

              child: Center(
                child: Image.asset(
                  "images/QFI logo .png",
                  fit: BoxFit.contain,
                  height: height * 0.2,
                  width: width * 0.4,

                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.45, //350,
                width: width, //400,
                color: Theme.of(context).backgroundColor,
              ),
            ),
            AnimatedPositioned(
                duration: Duration(milliseconds:1000 ),
                /*curve: Curves.easeInOutBack,*/
                right: moveRight,
                left: moveLeft,
                bottom: 0,
                top: height * 0.55,
                //350,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.05, //150,
                      width: width *0.4, //250,
                      /*color: Colors.blue,*/
                      child: Center(
                        child: Text('Q-Fi',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ],
                )),
            // Center(
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.of(context).pushReplacement(
            //             MaterialPageRoute(builder: (context) => HomePage()));
            //       },
            //       child: null),
            // )
          ],
        ),
      ),
    );
  }
}
/*
class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body:  Stack(
          fit: StackFit.expand,
          children: <Widget>[new Image.asset('assets/images/gallery.png')],
        ),
    );
  }
}*/
