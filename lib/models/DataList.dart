import 'package:flutter/cupertino.dart';

class DataList {
  DataList({this.title,this.icon,this.nextScreen,this.children = const <DataList>[]});
  Widget? icon;
  Widget? nextScreen;
  Widget? title;
  final List<DataList> children;
}