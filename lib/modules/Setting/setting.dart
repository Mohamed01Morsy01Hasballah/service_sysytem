import 'package:flutter/material.dart';
import 'package:service_system/Component/widgets.dart';
import 'package:service_system/modules/Setting/MenuList.dart';

import '../../Constant/Constant.dart';
import '../Cart/ShoppingCartScreen.dart';

class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: defaultColor
            ),
            child:Row(
              children: [
                Spacer(),
                Text('Setting',style: TextStyle(color: Colors.white,fontSize: 20),),
                Spacer(),

                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    InkWell(onTap: (){
                      navigatePush(context:context,widget: ShoppingCartScreen());
                    },child: Icon(Icons.notification_important,size: 50,color: Colors.green,)),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepPurple
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('3',style: TextStyle(color: Colors.white),),
                        ))
                  ],
                )
              ],
            )
        ),
       Expanded(
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: MenuList(),
         ),
       )
  ]
    );
  }
}
