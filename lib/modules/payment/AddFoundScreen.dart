import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';
import 'package:service_system/modules/payment/visa_payment_screen.dart';

import '../../localization/language_constants.dart';
import '../Button.dart';
import '../CustomTextField.dart';

class AddFoundScreen extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ServiceCubit(),
        child: BlocConsumer<ServiceCubit,ServiceStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit=ServiceCubit.get(context);
            double _width = MediaQuery.of(context).size.width;
            double _height = MediaQuery.of(context).size.height;
            List<Widget> payments = cubit.paymentWays
                .map(
                  (item) => Container(
                margin: EdgeInsets.only(left: 8),
                width: _width,
                child: Row(
                  children: [
                    Text((cubit.paymentWays.indexOf(item)+1).toString()+"- ",style: TextStyle(
                        fontSize: 18
                    ),),
                    SizedBox(width: 10,),
                    Image.network(item.paymentIcon!,width: 30,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Text(
                        item.paymentName!,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Radio(
                        value:  cubit.paymentWays.indexOf(item),
                        groupValue: cubit.valuePayment,
                        onChanged: (value){
                          cubit.valuePayment=value!;
                        }
                    ),
                  ],
                ),
              ),
            )
                .toList();
            return Scaffold(
              appBar: AppBar(
                title: Text(getTranslated(context, 'add_fund')),
                centerTitle: true,
              ),
              body: Container(
                height: _height,
                /*color: Theme.of(context).cardColor,*/
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextField(
                          hint: getTranslated(context, 'amount'),
                          icon: Icons.payments,
                          textEditingController: _textEditingController,
                          keyboardType: TextInputType.number,
                        ),
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
                          child: button(getTranslated(context, 'add'),cubit.valuePayment == 0
                              ? VisaPaymentScreen()
                              :// FawryPayment()
                          Text('Fawery') )),
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
