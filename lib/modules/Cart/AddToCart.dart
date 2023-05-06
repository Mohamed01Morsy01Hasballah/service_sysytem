import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Constant/AppTheme.dart';
import '../../localization/language_constants.dart';

import 'CustomDialog.dart';
import 'ShoppingCartScreen.dart';


class AddToCart extends StatefulWidget{
  String text;
  AddToCart(this.text);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  IconData myIcon=Icons.add_shopping_cart_rounded;
  Color _color=AppTheme.appColor;

  /*@override
  void initState() {
    text = getTranslated(context, 'add_to_cart');
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          if(widget.text==getTranslated(context, 'add_to_cart')){
            showDialog(context: context,
                builder: (BuildContext context){
                  return CustomDialogBox(
                    descriptions: getTranslated(context, 'cart_msg'),
                    positiveText: getTranslated(context,'cart_go'),
                    nextScreen: ShoppingCartScreen(),
                    headAvatar: Image.asset("assets/icons/shopping_icon.png",width:70,height: 70,fit: BoxFit.fill,),
                    negativeText: getTranslated(context, 'back'),
                  );
                }
            );
          }
          setState(() {
            _color==AppTheme.appColor?_color=Colors.grey:_color=AppTheme.appColor;
            widget.text==getTranslated(context, 'add_to_cart')?widget.text=getTranslated(context, 'added_to_cart'):widget.text=getTranslated(context, 'add_to_cart');
          });
        },
        child: Row(
          children: [
            Icon(
              myIcon,
              color: _color,
            ),
            Text(widget.text,style: TextStyle(color: _color, fontWeight: FontWeight.bold),),
          ],
        )
    );
  }

}