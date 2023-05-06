import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/modules/payment/visa_payment_screen.dart';


import '../../Constant/AppTheme.dart';
import '../../localization/language_constants.dart';
import '../Button.dart';
import '../CustomTextField.dart';


class AmountScreen extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'amount')),
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
                child: Text(getTranslated(context, 'enter_amount'),style: AppTheme.title,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _width*0.64,
                    child: CustomTextField(
                      hint: getTranslated(context, 'amount'),
                      icon: Icons.payments,
                      textEditingController: _textEditingController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                /*  Container(
                    height: _height * 0.065,
                    width: _width * 0.3,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: _currency,
                      label: getTranslated(context, 'currency'),
                      hint: getTranslated(context, 'currency'),
                      onChanged: print,

                    ),
                  ),*/
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top:20),
                  padding: EdgeInsets.all(8),
                  width: _width * 0.4,
                  child: button(getTranslated(context, 'add'),_value == 0
                      ? VisaPaymentScreen()
                      : Text('Fawery')))//FawryPayment())),
            ],
          ),
        ),
      ),
    );
  }
}
List<String> _currency=["USD",
    "EUR",
    "EGP",];