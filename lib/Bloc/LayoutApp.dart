import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';

import 'States.dart';

class LayoutApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ServiceCubit(),
      child: BlocConsumer<ServiceCubit,ServiceStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=ServiceCubit.get(context);
          return SafeArea(
            child: Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                index: cubit.Index,
                backgroundColor: Theme.of(context).primaryColor,
                color: Theme.of(context).scaffoldBackgroundColor,
                onTap: (value){
                  cubit.ChangeBottomChange(value);
                },
                items: [
                  Icon(Icons.home),
                  Icon(Icons.adjust),
                  Icon(Icons.access_time),
                  Icon(Icons.settings),

                ],
              ),
              body: cubit.Screen[cubit.currentIndex],
            ),
          );
        },
      ),
    );
  }
}
