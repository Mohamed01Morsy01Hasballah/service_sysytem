import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';
import 'package:service_system/Constant/Constant.dart';

class ModeScreen extends StatelessWidget {
  const ModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit,ServiceStates>(
      listener: (context,state){},
      builder:(context,state){
        var cubit=ServiceCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),

            ),
            title: Text('Mode',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
          body: Center(
            child: ListTile(
              leading: Icon(Icons.lightbulb,color:Theme.of(context).iconTheme.color),
              title: Text('Mode'),
              trailing: Switch(
                value: cubit.Switch,
                onChanged: (value){
                  cubit.ChangeMode(value);
                },
              ),
            )
          ),
        );
      },

    );
  }
}
