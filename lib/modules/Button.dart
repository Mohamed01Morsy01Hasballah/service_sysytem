import 'package:flutter/material.dart';

import '../Constant/AppTheme.dart';

class button extends StatefulWidget {
  String text;
  Widget nextScreen;
  button(this.text,this.nextScreen);
  @override
  _buttonState createState() => _buttonState(text,nextScreen);
}

class _buttonState extends State<button> with SingleTickerProviderStateMixin {
  String?_text;
  Widget? _nextScreen;
  _buttonState(this._text,this._nextScreen);

  double? _scale;
  AnimationController? _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 0,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller!.value;
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  _nextScreen!));

      },
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  Widget get _animatedButtonUI => Container(
    /* height: 40,*/
    constraints: BoxConstraints(
        minWidth: 100
    ),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.appColor,
            AppTheme.gradiantColor,
          ],
        )),
    child: Center(
      child: Text(
        _text!,
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.white),
      ),
    ),
  );

  void _onTapDown(TapDownDetails details) {
    _controller!.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller!.reverse();
  }
}