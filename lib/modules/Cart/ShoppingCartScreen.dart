import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Cubit.dart';
import '../../Bloc/States.dart';
import '../../Component/widgets.dart';
import '../../Constant/AppTheme.dart';
import '../../localization/language_constants.dart';
import 'BuyPlanScreen.dart';

class ShoppingCartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context)=>ServiceCubit()..ChangeCheckedShopping(),
    child: BlocConsumer<ServiceCubit,ServiceStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ServiceCubit.get(context);
        List<Widget> Shoppinglist = cubit.list.map((item)=>Column(
          children: [
            Row(
              children: [
                Checkbox(value:cubit.isCheckedShopping![cubit.list.indexOf(item)], onChanged: (value){
                 cubit.CheckBox(item, value);
                }),
                SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.itemName!,style: TextStyle(fontSize: 16),),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Text(getTranslated(context, 'price') +": ${item.price}"),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                       cubit.Deleteitem(item);
                      },
                      child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10.0),
                          child: Icon(Icons.delete,color: Colors.redAccent,)
                      ),
                    ),
                    InkWell(
                      onTap: (){
                      },
                      child:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10.0),
                          child: Text(getTranslated(context, 'view'),style: TextStyle(color: AppTheme.appColor,decoration: TextDecoration.underline),)
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.blueGrey,
            )
          ],
        )).toList();
        double _height = MediaQuery.of(context).size.height;
        double _width = MediaQuery.of(context).size.width;
        return Scaffold(

          appBar: AppBar(
            title: Text(
                getTranslated(context, 'shopping_cart')
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10,10,10,0),
                  child: Text(getTranslated(context, 'your_shopping_items'),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                Container(
                    width: _width-20,
                    height: _height*0.68,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: SingleChildScrollView(
                      child: Column(
                        children: Shoppinglist,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.symmetric( horizontal: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getTranslated(context,'total') +" 500",style: AppTheme.body1,),
                      InkWell(onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyBlanScreen()));
                      },child: BasicBtn(getTranslated(context, 'checkout'), AppTheme.appColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),

        );
      },
    ),
  );

  }
}
