import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Constant/AppTheme.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, positiveText, negativeText;
  final Widget? headAvatar, nextScreen;
  const CustomDialogBox(
      {Key? key,
        this.title,
        this.descriptions,
        this.positiveText,
        this.headAvatar,
        this.negativeText,
        this.nextScreen})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  double padding = 10;
  double avatarSize = 45;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 25),
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: padding, top: avatarSize, right: padding, bottom: padding),
          margin: EdgeInsets.only(top: avatarSize),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, padding),
                    blurRadius: padding),
              ]),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                widget.title != null
                    ? Text(
                  widget.title!,
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                )
                    : SizedBox(),
                Text(
                  widget.descriptions!,
                  style: TextStyle(fontSize: 14, height: 2),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.negativeText != null
                          ? InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.negativeText!,
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ))
                          : SizedBox(),
                      widget.positiveText != null
                          ? InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            if (widget.nextScreen != null)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => widget.nextScreen!));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.positiveText!,
                              style:
                              TextStyle(fontSize: 16, color: AppTheme.appColor),
                            ),
                          ))
                          : SizedBox(),
                    ]),
              ],
            ),
          ),
        ),
        Positioned(
            left: padding,
            right: padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: avatarSize,
              child: widget.headAvatar,
            )),
      ],
    );
  }
}
