import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';

import '../../Constant/AppTheme.dart';
import '../../localization/language_constants.dart';
import '../Button.dart';

class PaymentKindScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
         create: (context)=>ServiceCubit()..IntialValueKind(),
        child: BlocConsumer<ServiceCubit,ServiceStates>(
          listener: (context,state){},
            builder: (context,state){
              double _width = MediaQuery.of(context).size.width;
              double _height = MediaQuery.of(context).size.height;
       var cubit=ServiceCubit.get(context);
       List<Widget> payments = cubit.paymentWaysKind
           .map(
             (item) => Container(
           margin: EdgeInsets.only(left: 8),
           width: _width,
           child: Row(
             children: [
               Radio(
                 value: cubit.paymentWaysKind.indexOf(item),
                 groupValue:cubit.valueKind,
                 onChanged: ( value) {
                   cubit.valueKind=value!;
                 },
               ),
               Image.network(item.paymentIcon,width: 30,),
               SizedBox(width: 10,),
               Text(
                 item.paymentName,
               ),
               SizedBox(width: 10,),
             ],
           ),
         ),
       )
           .toList();
              return Scaffold(
                appBar: AppBar(
                  title: Text(getTranslated(context, 'payment_kind')),
                  centerTitle: true,
                ),
                body: Container(
                  height: _height,
                  color: Theme.of(context).cardColor,
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: _width,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.all(8),
                          child: Text(getTranslated(context, 'choose_payment_way'),style: AppTheme.title,),
                        ),
                        Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: payments
                        ),
                        Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            width: _width * 0.5,
                            child: button(getTranslated(context, 'next'),cubit.paymentWaysKind.elementAt(cubit.valueKind!).nextScreen)),
                      ],
                    ),
                  ),
                ),
              );

            },
        )
    );
  }
}
