import 'dart:io';

import 'package:flutter/material.dart';

import '../Constant/AppTheme.dart';
import '../Constant/Constant.dart';
import '../localization/language_constants.dart';
import '../models/ShoppingItemModel.dart';
import '../modules/Cart/AddToCart.dart';

Widget BuiltTextField(
    {
      required String label,
      required TextInputType  type,
      required TextEditingController controller,
      required IconData prefix,
      IconData? suffix,
      validate,
      bool secure=false,
      suffixPressed,
      Function? onsubmit,
      context

    }
    )=> Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(primary: defaultColor),


      ),
      child: Container(
  decoration: BoxDecoration(

        border: Border(
            top: BorderSide(color: Colors.grey,width: 0.5),
            bottom: BorderSide(color: Colors.grey,width: 0.5),

            right:BorderSide(color: Colors.grey,width: 0.5),
            left: BorderSide(color: Colors.grey,width: 0.5)
        ),
      //  color: Theme.of(context).scaffoldBackgroundColor
  ),

  child: TextFormField(
        keyboardType: type,
        controller:controller ,
        obscureText: secure,
        onFieldSubmitted:(s){
          onsubmit!(s);
        } ,
        decoration: InputDecoration(
            labelText:label,
            fillColor: defaultColor,
            focusColor: defaultColor,
            labelStyle:TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color
            ) ,
            prefixIconColor:  Theme.of(context).textTheme.bodyText1!.color
    ,
            alignLabelWithHint: true,
            prefixIcon: Icon(
                prefix
            ),
            suffixIcon: TextButton(
              onPressed:suffixPressed ,
              child: Icon(
                  suffix
              ),
            ),
            border:OutlineInputBorder(),
        ),
        validator: validate
),
      ),
    );
Widget BuiltButton(
    {
      required double height,
      required Color color,
      required String text,
      required  Function function,

    }
    )=>
    Container(
      width: double.infinity,
      height: height,
      color: color,
      child: MaterialButton(
        onPressed:(){
          function();
        },
        child: Text(text.toUpperCase()),

      ),
    );
void navigatePush({
  required Widget widget,
  context
})=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
void navigateFininsh({
  Widget ,
  context
})=>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context)=>Widget)
        ,(route) => false
    );
Widget BuiltItemCustomer(){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
    ),
    child: Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('Mohamed Morsy',style: TextStyle(color: defaultColor),)
                  ],
                ),
                Container(height: 35,width: 35, child: Image.asset('images/Icon/chat.png'))
              ],
            ),
            SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('moh.morsy@gmail.com',style: TextStyle(color: defaultColor),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address      ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('Damnhour',style: TextStyle(color: defaultColor),)
                  ],
                ),
              ],
            ),
            SizedBox(height: 7,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Home Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('www.PageUrl.com',style: TextStyle(color: defaultColor),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Visit Count',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('20',style: TextStyle(color: defaultColor),)
                  ],
                ),
              ],
            ),
            SizedBox(height: 7,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Redirect',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('www.facebook.com',style: TextStyle(color: defaultColor),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Visited',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('10 Aug,03:24:45',style: TextStyle(color: defaultColor),)
                  ],
                ),
              ],
            ),
            SizedBox(height: 7,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('OPPO-A-15',style: TextStyle(color: defaultColor),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
                    Text('Android 10',style: TextStyle(color: defaultColor),)
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    ),
  );
}


Widget BasicBtn( String text,Color color){
  return Container(
    margin: EdgeInsets.symmetric(vertical:4 ),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      border: Border.all(color: color),
      color: color,
    ),
    child: Text(text,style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.white
    ),),
  );
}
Widget SearchResult(BuildContext context,bool available,ShoppingItemModel domain){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(domain.itemName!,style: TextStyle(color: AppTheme.appColor,fontWeight: FontWeight.w300,fontSize: 16),),
          ),
          available?
          Text(getTranslated(context, 'available'),style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold),)
              :
          Text(getTranslated(context, 'not_available'),style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(getTranslated(context, 'price') +": ${domain.price}" ,style: TextStyle(color: AppTheme.appColor,fontWeight: FontWeight.w300,fontSize: 14),),
          ),
          available?AddToCart(getTranslated(context, 'add_to_cart')):
          Icon(Icons.remove_shopping_cart_rounded,)
        ],
      ),
    ],
  );
}
Widget CustomContainer(BuildContext context,Widget childWidget){
  return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        /*boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]*/
      ),
      child: childWidget
  );
}