import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/modules/Button.dart';
import 'package:service_system/modules/SettingScreen.dart';
import 'package:service_system/modules/payment/PaymentKindScreen.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/hex_color.dart';

import '../../Bloc/Cubit.dart';
import '../../Bloc/States.dart';
import '../../Component/widgets.dart';
import '../../Constant/AppTheme.dart';
import '../../localization/language_constants.dart';
import '../../models/ShoppingItemModel.dart';
import 'CheckoutScreen.dart';

class BuyBlanScreen extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context)=>ServiceCubit()..ChangeCheckedShopping()..initialSearch(),
        child: BlocConsumer<ServiceCubit,ServiceStates>(
        listener: (context,state){},
            builder: (context,state){
        var cubit=ServiceCubit.get(context);
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(getTranslated(context, 'complete_your_order')),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(color: Theme.of(context).accentColor),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),

                      ),

                      tabs: [
                        Tab(
                          text: 'New Domain',
                        ),
                        Tab(
                          text: 'Have Domain',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: cubit.SearchResult ? _height * 0.25 : _height * 0.14,
                    width: _width-20 ,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TabBarView(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {
                                    cubit.SearchRes();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all( 5),
                                    child:Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              height: 45,
                                              // color: Colors.white,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(5),
                                                      bottomLeft: Radius.circular(5)
                                                  )

                                              ),
                                              child:Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 2),
                                                child: TextFormField(
                                                  controller: _textEditingController,
                                                  decoration: InputDecoration(
                                                      border:InputBorder.none,
                                                      hintText: 'Enter Domain',
                                                      hintStyle: TextStyle(color: Colors.grey)

                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                        Container(
                                          height: 45,
                                          // width: 40,
                                          decoration: BoxDecoration(
                                              color: HexColor('#140529'),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight: Radius.circular(10)
                                              )


                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                                            child: Icon(Icons.search,color: Colors.white,size: 30,),
                                          ),
                                        ),
                                      ],
                                    )


                                  )),
                              cubit.SearchResult
                                  ? CustomContainer(
                                context,
                                SearchResult(
                                    context,
                                    true,
                                    ShoppingItemModel(
                                        _textEditingController.value.text,
                                        240)),
                              )
                                  : SizedBox(),
                            ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                    height: 45,
                                    // color: Colors.white,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            bottomLeft: Radius.circular(5)
                                        )

                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 2),
                                      child: TextFormField(
                                        controller: _textEditingController,
                                        decoration: InputDecoration(
                                            border:InputBorder.none,
                                            hintText: 'Enter Domain',
                                            hintStyle: TextStyle(color: Colors.grey)

                                        ),
                                      ),
                                    )
                                ),
                              ),
                              Container(
                                height: 45,
                                // width: 40,
                                decoration: BoxDecoration(
                                    color: HexColor('#140529'),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)
                                    )


                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                                  child: Icon(Icons.search,color: Colors.white,size: 30,),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                   CustomContainer(
                context
                , Wrap(
                  children:[
                    Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: list,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Country",
                          hintText: "country in menu mode",
                        ),
                      ),
                      onChanged: (value){
                        cubit.ChangeInputOne(value);
                      },
                      selectedItem:cubit.ChooseInputOne ,
                    ),


                  ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          disabledItemFn: (String s) => s.startsWith('I'),
                        ),
                        items:billingList ,
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            labelText: "Country",
                            hintText: "country in menu mode",
                          ),
                        ),
                        onChanged: (value){
                          cubit.ChangeInputTwo(value);
                        },
                        selectedItem:cubit.ChooseInputTwo ,
                      ),
                    ),
                  ]
                ),
              ),
                  /*PlanScheme(_planModel.propertiesList),*/
                  /*SizedBox(height: 18,),
              CustomContainer(
                context,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Select Addons",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                  ],
                ),
              ),*/
                  SizedBox(height: 10,),
                  CheckoutScreen(),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: _width*0.5,
                    child: button(getTranslated(context, 'next'),PaymentKindScreen()),
                  ),
                  SizedBox(height: 6,)
                ],
              ),
            ),

          ),
        );
      }
      )
      );
  }

  List<String> list = ["plan1", "plan2", "plan3"];
  List<String> billingList = [
    "1 month @ \$9.75/mo",
    "12 months @ \$7.25/mo  - 30.40% Off!",
    "36 months @ \$2.75/mo  - 60.50% Off!"
  ];
}
