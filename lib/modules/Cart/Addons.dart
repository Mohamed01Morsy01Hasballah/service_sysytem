import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/AddonsModel.dart';

class Addons extends StatelessWidget{
  AddonsModel? addonsModel;
  Addons(this.addonsModel);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.network(addonsModel!.icon!,width: 40,),
        SizedBox(width:10),
        Expanded(
          child: Text(addonsModel!.title!,style: TextStyle( fontSize: 14,fontWeight: FontWeight.w300,),maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,),
        ),
        SizedBox(width:10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: addonsModel!.sale!?[
            Image.network("https://icons.iconarchive.com/icons/custom-icon-design/flatastic-4/512/Sale-icon.png",width: 25,),
            Text(addonsModel!.previousPrice!,style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.redAccent,fontSize: 16),),
            Text(addonsModel!.price!),
          ]:[
            SizedBox(width: 30,),
            Text("${addonsModel!.price}")
          ],
        ),
      ],);
  }

}