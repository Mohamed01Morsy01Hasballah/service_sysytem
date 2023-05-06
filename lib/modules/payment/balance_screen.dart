import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Constant/AppTheme.dart';
import '../../localization/language_constants.dart';
import '../../models/FinancialOperation.dart';
import '../Button.dart';
import 'PaymentKindScreen.dart';

class BalanceScreen extends StatelessWidget{
  String username="MohamedKhaled";
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    List<TableRow> operationsRows =operationList.map((item) => TableRow(
        children: [
          TableCell(child: tableCell(item.operationID.toString()),),
          TableCell(child: tableCell(item.date!)),
          TableCell(child: tableCell(item.amount.toString())),
          TableCell(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0 ,horizontal: 4),
            child: Text(item.orderID.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 12,color: AppTheme.appColor,decoration: TextDecoration.underline),),
          ))
        ]
    )).toList();
    operationsRows.insert(0, TableRow(
        children: [
          TableCell( child: tableCell(getTranslated(context, 'operation_id'))),
          TableCell( child: tableCell(getTranslated(context, 'date'))),
          TableCell( child: tableCell(getTranslated(context, 'amount'))),
          TableCell( child: tableCell(getTranslated(context, 'order_id'))),
        ]
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context,'balance_screen')),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                width: _width,
                decoration: BoxDecoration(
                  color: AppTheme.appColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(getTranslated(context, 'hello')+" "+username,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),), //replace username with real name
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_balance,color: Colors.white,size: 20,),
                        SizedBox(width: 5,),
                        Text(getTranslated(context, 'account_balance'),style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w300),),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Text("500\$",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),), //replace username with real Balance
                    SizedBox(height: 16,),
                    Container(
                      alignment: Alignment.center,
                        width: _width*0.5,
                        child: button(getTranslated(context, 'add_fund'),PaymentKindScreen()))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:16,bottom: 6),
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                width: _width,
               decoration: BoxDecoration(
                 color: Theme.of(context).cardColor,
                 borderRadius: BorderRadius.all(Radius.circular(5)),
               ),
               child:  Row(
                children: [
                  Image.network("https://image.flaticon.com/icons/png/512/1233/1233558.png",width: 40,),
                  SizedBox(width: 15),
                  Text(getTranslated(context, 'financial_operations'),style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: AppTheme.appColor),),
                  /*Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                      ),*/
                ],
              ), ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(8),
                width: _width,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Table(
                  border: TableBorder.all(),
                  children: operationsRows
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
List<FinancialOperation> operationList = [
  FinancialOperation(1585684, "24/8/2020", 225, 12633666),
  FinancialOperation(1585684, "24/8/2020", 225, 12633666),
  FinancialOperation(1585684, "24/8/2020", 225, 12633666),
];

Widget tableCell(String value){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0 ,horizontal: 4),
    child: Text(value,textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),
  );
}