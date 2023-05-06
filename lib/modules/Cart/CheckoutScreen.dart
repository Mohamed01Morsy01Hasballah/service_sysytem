import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';

import '../../Constant/AppTheme.dart';
import 'Addons.dart';

class CheckoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ServiceCubit()..ChangeCheckedAddons(),
      child: BlocConsumer<ServiceCubit,ServiceStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=ServiceCubit.get(context) ;
          double _width = MediaQuery.of(context).size.width;
          double _height = MediaQuery.of(context).size.height;
          List <Widget> AddonsList = cubit.Addonslist.map((item) {
            return Padding(
              padding: EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(value: cubit.isCheckedAddons![cubit.Addonslist.indexOf(item)], onChanged: (value){
                        cubit.CheckBoxAddons(item, value);
                      }),
                      Expanded(child: Addons(item)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20.0),
                    child: Divider(
                        color:Colors.blueGrey
                    ),
                  )
                ],
              ),
            );
          }
          ).toList();
          return Container(
            margin: EdgeInsets.all(8),
            width: _width-20,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: _height*0.1,
                  decoration: BoxDecoration(
                      color: AppTheme.appColor,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight:Radius.circular(5) )
                  ),
                  child: Text(("Select Addons"),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
                /*CustomDivider(),*/
                SizedBox(height: 10,),
                Wrap(
                    children: AddonsList
                ),
                SizedBox(height: 10,),

              ],
            ),
          );

        },
      ),
    );
  }
}
