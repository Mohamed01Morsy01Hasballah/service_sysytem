import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';

import '../../Constant/AppTheme.dart';
import '../../localization/language_constants.dart';
import '../Button.dart';
import 'amount_screen.dart';

class PaymentWayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context)=>ServiceCubit(),
      child: BlocConsumer<ServiceCubit,ServiceStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=ServiceCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(getTranslated(context, 'payment_way')),
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
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text(getTranslated(context, 'choose_payment_way'),style: AppTheme.title,),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      height: _height*0.08,
                      width: _width,
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items:_paymentWays ,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: getTranslated(context, 'payment_way'),
                            hintText: getTranslated(context, 'payment_way'),
                          ),
                        ),
                        onChanged: (value){
                          cubit.ChooseInputThree(value);
                        },
                        selectedItem:cubit.ChooseInputThree ,
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        width: _width * 0.5,
                        child: button(getTranslated(context, 'next'),AmountScreen())),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }


}

List<String> _paymentWays = [
  "Visa",
  "Master Card",
  "Visa",
  "Master Card",
];