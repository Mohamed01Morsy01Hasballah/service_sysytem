import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:service_system/Bloc/LayoutApp.dart';
import 'package:service_system/modules/Button.dart';
import 'package:service_system/modules/HomeScreen.dart';


import '../../localization/language_constants.dart';
import '../CustomTextField.dart';

class VisaPaymentScreen extends StatelessWidget {
  double? _height;
  double ?_width;
  double ?_padding;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;
    _padding = _height! * 0.02;
    return Scaffold(
      appBar: AppBar(

        title: Text(getTranslated(context, 'complete_payment')),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
             // form(context),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                width: _width!,
                height: _height! * 0.1,
                child: Image.network(
                  "https://unblast.com/wp-content/uploads/2018/08/Credit-Card-Icons.jpg",
                  fit: BoxFit.cover,),
              ),
              CustomTextField(keyboardType: TextInputType.text,
                  icon: Icons.badge,
                  hint: getTranslated(context, 'card_name')),
              SizedBox(height: _padding),
              CustomTextField(keyboardType: TextInputType.text,
                  icon: Icons.credit_card,
                  hint: getTranslated(context, 'card_num')),
              SizedBox(height: _padding),
            /*  Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: _height * 0.065,
                    width: _width * 0.25,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: _month,

                      label: getTranslated(context, 'month'),
                      hint: getTranslated(context, 'month'),
                      onChanged: print,

                    ),
                  ),
                  Container(
                    height: _height * 0.065,
                    width: _width * 0.3,
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: _year,
                      label: getTranslated(context, 'year'),
                      hint: getTranslated(context, 'year'),
                      onChanged: print,

                    ),
                  ),
                  Container(
                    width: _width * 0.28,
                    child: CustomTextField(keyboardType: TextInputType.text,
                        icon: Icons.fact_check,
                        hint: getTranslated(context, 'cvv')),
                  ),
                ],
              ),*/
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                width: _width !* 0.5,
                child: button(getTranslated(context, 'complete'), LayoutApp()),
              )
            ],
          ),
        ),
      ),
    );
  }
  /*
    Widget form(BuildContext context) {
      return Form(
        child: Column(
          children: <Widget>[
            Text( getTranslated(context, 'account_info'),
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),
            SizedBox(height: _padding),
            nameTextFormField(data: "Mohamed Khaled"),
            SizedBox(height: _padding),
            phoneTextFormField(data: "1234567890"),
            SizedBox(height: _padding,),
            emailTextFormField("test@test.com"),
            SizedBox(height: _padding),
            addressTextFormField(data: "Giza"),
            SizedBox(height: _padding),
            /*
            Container(
              height: _height! * 0.065,
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: _countries,
                  label: getTranslated(context, 'country'),
                  hint: getTranslated(context, 'country'),
                  showSearchBox: true,
                  onChanged: print,
                  enabled: false,
                  selectedItem: "Egypt"
              ),
            ),
            */
            SizedBox(height: _padding),
            /*
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: _height! * 0.065,
                  width: _width! / 2.4,
                  child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: _countries,
                      label: getTranslated(context, 'city'),
                      showSearchBox: false,
                      onChanged: print,
                      enabled: false,
                      selectedItem: "Egypt"
                  ),
                ),
                Container(
                  height: _height * 0.065,
                  width: _width / 2.4,
                  child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: _countries,
                      label: getTranslated(context, 'state'),
                      dialogMaxWidth: _width / 4,
                      showSearchBox: false,
                      onChanged: print,
                      enabled: false,
                      selectedItem: "Egypt"
                  ),
                ),
              ],
            ),
            */
          ],
        ),
      );
    }
    Widget nameTextFormField(String data) {
      if (data != null)
        return CustomTextField(
          keyboardType: TextInputType.text,
          icon: Icons.person,
          hint: data,
          enabled: false,
        );
    }

    Widget lastNameTextFormField(String? data) {
      if (data != null)
        return CustomTextField(
          keyboardType: TextInputType.text,
          icon: Icons.person,
          hint: data,
          enabled: false,
        );
    }


    Widget emailTextFormField(String data) {
      return CustomTextField(
        keyboardType: TextInputType.emailAddress,
        icon: Icons.email,
        hint: data,
        enabled: false,
      );
    }

    Widget phoneTextFormField({String? data}) {
      if (data != null)
        return CustomTextField(
          keyboardType: TextInputType.text,
          icon: Icons.phone,
          hint: data,
          enabled: false,
        );
    }

    Widget addressTextFormField({String? data}) {
      if (data != null)
        return CustomTextField(
          keyboardType: TextInputType.text,
          icon: Icons.home,
          hint: data,
          enabled: false,
        );
    }
    */
  }
List<String> _countries =["Egypt","Saudi Arabia","USA"];
List<String> _month=["01","02","03","04","05","06","07","08","09","10","11","12"];
List<String> _year=["2021","2022","2023","2024","2025","2026","2027","2028","2029","2030","2031","2032"];
