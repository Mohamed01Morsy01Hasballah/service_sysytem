import 'package:flutter/material.dart';
import 'package:service_system/modules/CurrentCustomers.dart';
import 'package:service_system/modules/LanguageScreen.dart';
import 'package:service_system/modules/LastCustomers.dart';
import 'package:service_system/modules/ProbablyCustomers.dart';
import 'package:service_system/modules/VisitorCustomers.dart';

import '../../Constant/Constant.dart';
import '../../localization/language_constants.dart';
import '../../models/DataList.dart';
import '../DarkModeScreen.dart';
import '../DataPopUp.dart';
import '../ProductScreen.dart';
import '../ServicesScreen.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? _width;
    double? _height;
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    final List<DataList> data = <DataList>[
      DataList(
        title: Text(getTranslated(context, 'app_setting')),
        icon: Icon(Icons.settings_outlined),
        children: <DataList>[
          DataList(
              title: Text(getTranslated(context, 'dark_mode')),
              icon: Icon(Icons.dark_mode_outlined),
              nextScreen: DarkModeScreen()),
          DataList(
              title: Text(getTranslated(context, 'language')),
              icon: Icon(Icons.language_outlined),
              nextScreen: LanguageScreen()),
        ],
      ),
      DataList(
        title: Text('Customers'),
        icon: Icon(Icons.settings_outlined),
        children: <DataList>[
          DataList(
              title: Text('Probably Customers'),
              icon: Icon(Icons.supervisor_account_outlined),
              nextScreen: ProbablyCustomers()
          ),
          DataList(
              title: Text('Current Customers'),
              icon: Icon(Icons.supervisor_account_outlined),
              nextScreen: CurrentCustomers()
       ),
          DataList(
            title: Text('Last Customers'),
            icon: Icon(Icons.supervisor_account_outlined),
            nextScreen: LastCustomers()
          ),
          DataList(
            title: Text('Visitor Customers'),
            icon: Icon(Icons.supervisor_account_outlined),
             nextScreen: VisitorCustomers()
          ),

        ],
      ),
      DataList(
        title: Text('Visitors'),
        icon: Container(height:30,width:30,child: Image.asset('images/Icon/visitor.png',)),
        children: <DataList>[
          DataList(
            title: Text('Visitors Have Name'),
            icon: Icon(Icons.ad_units_outlined),
            // nextScreen: LanguageScreen()
          ),
          DataList(
            title: Text('Visitors With No Name'),
            icon: Icon(Icons.ad_units_outlined),
            // nextScreen: LanguageScreen()
          ),

        ],
      ),

      DataList(
        title: Text('Groups'),
        icon:Icon(Icons.ad_units)
      ),
      DataList(
          title: Text('Products'),
          icon: Container(height:30,width:30,child: Image.asset('images/Icon/delivery-box.png',)),
        nextScreen: ProductScreen()
      ),
      DataList(
          title: Text('Services'),
          icon:Icon(Icons.ad_units),
        nextScreen: ServicesScreen()
      ),
      DataList(
          title: Text('Plans'),
          icon:Container(height:
          30,width:30,child: Image.asset('images/Icon/business-plan.png',)),
      ),
      DataList(
        title: Text('Metting'),
        icon: Container(height:30,width:30,child: Image.asset('images/Icon/videoconference.png',)),
        children: <DataList>[
          DataList(
            title: Text('Video Call'),
            icon: Container(height:30,width:30,child: Image.asset('images/Icon/videoconference.png',)),
            //nextScreen: LanguageScreen()
          ),
          DataList(
            title: Text('Voice Call'),
            icon: Container(height:30,width:30,child: Image.asset('images/Icon/videoconference.png',)),
            // nextScreen: LanguageScreen()
          ),

        ],
      ),
      DataList(
          title: Text('Others'),
          icon:Icon(Icons.notification_important_rounded)
      ),









    ];
    return   Container(
      height: _height,
      width: _width,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            DataPopUp(data[index]),
        itemCount: data.length,
           ),
    );

  }

}
