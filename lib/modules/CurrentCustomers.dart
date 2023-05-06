import 'package:flutter/material.dart';
import 'package:service_system/Constant/Constant.dart';

import '../Component/widgets.dart';

class CurrentCustomers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Current Customers'),
          centerTitle: true,
          backgroundColor: defaultColor,
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context,index)=>BuiltItemCustomer(),
              separatorBuilder: (context,index)=>SizedBox(height: 15,),
              itemCount: 7
          ),
        )
    );
  }

}
