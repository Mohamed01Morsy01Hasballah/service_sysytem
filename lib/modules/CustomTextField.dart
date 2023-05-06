
import 'package:flutter/material.dart';

import '../Component/ResponsiveWidget.dart';
import '../Constant/AppTheme.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final IconData? icon;
  final bool? enabled;
  double? _width;
  double? _pixelRatio;
  bool? large;
  bool? medium;


  CustomTextField(
      {this.hint,
        this.textEditingController,
        this.keyboardType,
        this.icon,
        this.obscureText= false,
        this.enabled=true,
      });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large =  ResponsiveWidget.isScreenLarge(_width!, _pixelRatio!);
    medium=  ResponsiveWidget.isScreenMedium(_width!, _pixelRatio!);
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppTheme.appColor,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        prefixIcon: Icon(icon, color: AppTheme.appColor, size: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.appColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,width: 0.5),
        ),
        labelText: hint,
        labelStyle: TextStyle(color: AppTheme.appColor),
      ),
      enabled: enabled,
    );
  }
}
