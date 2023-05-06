import 'package:flutter/material.dart';

class PaymentWayKind {
  String paymentName;
  String paymentIcon;
  Widget nextScreen;

  PaymentWayKind(this.paymentName, this.paymentIcon,this.nextScreen);
}