import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';
import 'package:service_system/Component/widgets.dart';
import 'package:service_system/Constant/Constant.dart';
import 'package:service_system/modules/CurrentCustomers.dart';
import 'package:service_system/modules/Language.dart';
import 'package:service_system/modules/LastCustomers.dart';
import 'package:service_system/modules/ModeScreen.dart';
import 'package:service_system/modules/ProbablyCustomers.dart';
import 'package:service_system/modules/ProductScreen.dart';
import 'package:service_system/modules/ServicesScreen.dart';
import 'package:service_system/modules/VisitorCustomers.dart';


class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit,ServiceStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ServiceCubit.get(context);
        return  SingleChildScrollView(
          child: Column(
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
                           // navigatePush(context:context,widget: ShoppingCartScreen());
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                     cubit.ChangeSetting();
                      },
                      child: ListTile(
                        leading: Icon(Icons.person,color: Theme.of(context).iconTheme.color,),
                        title: Text('Aplication Setting '),
                        trailing: cubit.Setting?Icon(Icons.arrow_drop_down,color: Theme.of(context).iconTheme.color):Icon(Icons.arrow_drop_up_outlined,color: Theme.of(context).iconTheme.color),
                      ),
                    ),
                    cubit.Setting?
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                           // navigatePush(context:context,widget:
                          //  );
                          },
                          child: ListTile(
                            leading: Icon(Icons.language,color: Theme.of(context).iconTheme.color),
                            title: Text('Language '),
                          ),
                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                          navigatePush(context:context,widget: ModeScreen());
                          },
                          child: ListTile(
                            leading: Icon(Icons.lightbulb,color: Theme.of(context).iconTheme.color),
                            title: Text('Mode '),
                          ),
                        ),
                        SizedBox(height: 10,),

                        ListTile(
                          leading: Icon(Icons.notification_important,color: Theme.of(context).iconTheme.color),
                          title: Text(' Notification '),
                        ),
                        SizedBox(height: 10,),
                        ListTile(
                          leading: Icon(Icons.chat,color: Theme.of(context).iconTheme.color),
                          title: Text(' Chat Sound '),
                        ),
                        SizedBox(height: 5,),


                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.grey,
                        )

                      ],
                    ):SizedBox(height: 5,),
                    InkWell(
                      onTap: (){
                        cubit.ChangeSettingOne();
                      },
                      child: ListTile(
                        leading: Icon(Icons.supervisor_account_outlined,color: Theme.of(context).iconTheme.color),
                        title: Text('Customers '),
                        trailing: cubit.SettingOne?Icon(Icons.arrow_drop_down,color: Theme.of(context).iconTheme.color):Icon(Icons.arrow_drop_up_outlined,color: Theme.of(context).iconTheme.color),
                      ),
                    ),
                    cubit.SettingOne?
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            navigatePush(context:context,widget: ProbablyCustomers());
                          },
                          child: ListTile(
                            leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                            title: Text('Probably Customers '),
                          ),
                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            navigatePush(context:context,widget: CurrentCustomers());

                          },
                          child: ListTile(
                            leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                            title: Text('Current Customers '),
                          ),
                        ),
                        SizedBox(height: 10,),

                        InkWell(
                          onTap: (){
                            navigatePush(context:context,widget: LastCustomers());

                          },
                          child: ListTile(
                            leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                            title: Text(' Last Customers '),
                          ),
                        ),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            navigatePush(context:context,widget: VisitorCustomers());

                          },
                          child: ListTile(
                            leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                            title: Text(' Visitor Customer '),
                          ),
                        ),
                        SizedBox(height: 5,),


                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.grey,
                        )

                      ],
                    ):SizedBox(height: 5,),
                    InkWell(
                      onTap: (){
                        cubit.ChangeSettingTwo();
                      },
                      child: ListTile(
                        leading: Container(height:30,width:30,child: Image.asset('images/Icon/visitor.png',)),

                        title: Text('Visitors '),
                        trailing: cubit.SettingTwo?Icon(Icons.arrow_drop_down,color: Theme.of(context).iconTheme.color)
                            :Icon(Icons.arrow_drop_up_outlined,color: Theme.of(context).iconTheme.color),
                      ),
                    ),
                    cubit.SettingTwo?
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                          title: Text('Visitors Have Name '),
                        ),
                        SizedBox(height: 10,),

                        ListTile(
                          leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                          title: Text(' Visitor With No Name '),
                        ),
                        SizedBox(height: 5,),


                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.grey,
                        )

                      ],
                    ):SizedBox(height: 5,),
                    ListTile(
                      leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                      title: Text('Groups '),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        navigatePush(context:context,widget: ProductScreen());
                      },
                      child: ListTile(
                        leading:   Container(height:30,width:30,child: Image.asset('images/Icon/delivery-box.png',)),

                        title: Text('Products '),
                      ),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        navigatePush(context:context,widget: ServicesScreen());
                      },
                      child: ListTile(
                        leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                        title: Text('Services '),
                      ),
                    ),
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Container(height:
                          30,width:30,child: Image.asset('images/Icon/business-plan.png',)),
                      title: Text('Plans '),
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        cubit.ChangeSettingThree();
                      },
                      child: ListTile(
                        leading: Container(height:30,width:30,child: Image.asset('images/Icon/videoconference.png',)),
                        title: Text('Metting '),
                        trailing: cubit.SettingThree?Icon(Icons.arrow_drop_down,color: Theme.of(context).iconTheme.color)
                            :Icon(Icons.arrow_drop_up_outlined,color: Theme.of(context).iconTheme.color),
                      ),
                    ),
                    cubit.SettingThree?
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                          title: Text('Video call '),
                        ),
                        SizedBox(height: 10,),

                        ListTile(
                          leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                          title: Text(' Voice call '),
                        ),
                        SizedBox(height: 5,),


                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.grey,
                        )

                      ],
                    ):SizedBox(height: 5,),

                    ListTile(
                      leading: Icon(Icons.ad_units_outlined,color: Theme.of(context).iconTheme.color),
                      title: Text('Others '),
                    ),
                  ],
                ),
              ),


            ],
          ),
        );
      },

    );
  }
}
