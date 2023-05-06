import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';
import 'package:service_system/Component/widgets.dart';
import 'package:service_system/Constant/Constant.dart';
import 'package:service_system/modules/DetailsHome.dart';

class HomeScreen extends StatelessWidget {
  var search =TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<ServiceCubit,ServiceStates>(
      listener: (context,state){},
      builder: (context,state){
        return SingleChildScrollView(


          child: Column(
            children: [
              Container(
                height: size.height *0.19,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          HexColor('#140529'),
                          HexColor('#061892')

                        ]
                    ),

                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)
                    )
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: size.height * 0.075,
                      left: size.width * 0.6,
                      child: Container(
                        height: size.height * .156,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300]!.withOpacity(0.7)
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.075,
                      right: size.width * 0.6,
                      child: Container(
                        height: size.height * .156,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.7)
                        ),
                      ),
                    ),
                    Positioned(
                      top:size.height * 0.10,
                      // bottom: -20,
                      left: size.width *.1,
                      child: Container(
                        height: size.height * .30,
                        width: size.width *1.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border(
                              top: BorderSide(color: Colors.grey,width: 0.5),
                              bottom: BorderSide(color: Colors.grey,width: 0.5),

                              right:BorderSide(color: Colors.grey,width: 0.5),
                              left: BorderSide(color: Colors.grey,width: 0.5)
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // left: 2
                      top:10,
                      left: 15,
                      right: 15,
                      child: Container(
                        width: double.infinity,
                        // height: 50,
                        child: Row(
                          children: [
                            Container(
                              height: 45,
                              // width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('#140529')
                              ),
                              child:Padding(
                                padding: const EdgeInsets.symmetric(vertical: 3.0,horizontal: 5),
                                child: Icon(Icons.menu_outlined,size: 40,color: Colors.white),
                              ),

                            ),
                            SizedBox(width: 10,),
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
                                      controller: search,
                                      decoration: InputDecoration(
                                          border:InputBorder.none,
                                          hintText: 'Search',
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
                      ),
                    ),
                    Positioned(
                      bottom:8 ,
                      left: 15,
                      right: 15,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(height:25,width:25,color:HexColor('#140529'), child: Image.asset('images/Icon/mute.png',color: Colors.white,)),
                              SizedBox(height: 5,),
                              Text(' mute',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text('Visitors',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text('270000',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                            ],
                          )

                        ],
                      ),
                    )





                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5,
                    left: 5,
                    right: 5
                ),
                child: InkWell(
                  onTap: (){
                    navigatePush(context:context,widget: DetailsHome());
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(height:30,width:30,child: Image.asset('images/Icon/egypt.png',)),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ahmed',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,fontSize: 15
                                  ),),
                                  SizedBox(height: 15,),
                                  Text('Cairo , Egypt',style: TextStyle(color: Colors.grey),)
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text('Last Visit',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontWeight: FontWeight.bold,fontSize: 13
                                      ),),
                                      SizedBox(width: 5,),
                                      Text('10 Aug 01:22:50',style: TextStyle(color: defaultColor,fontSize: 12),),



                                    ],
                                  ),
                                  //Spacer(),
                                  SizedBox(height: 5,),
                                  Container(height:30,width:30,child: Image.asset('images/Icon/chat.png',)),


                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(height:30,width:30,child: Image.asset('images/Icon/schedule.png',)),

                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Date',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontWeight: FontWeight.bold,fontSize: 15
                                      )),
                                      Text('15 Aug ,01:32:55',style: TextStyle(color: defaultColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(height:30,width:30,child: Image.asset('images/Icon/ip-address.png',)),
                                  SizedBox(width: 5,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('IP',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontWeight: FontWeight.bold,fontSize: 15
                                      )),
                                      Text('192.255.168.15',style: TextStyle(color: defaultColor),)
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(height:35,width:35,child: Image.asset('images/Icon/browser.png',)),

                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Redirected',style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontWeight: FontWeight.bold,fontSize: 15
                                      )),
                                      Text('www.google.com',style: TextStyle(color: defaultColor),)
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(height:30,width:30,child: Image.asset('images/Icon/globe.png',)),
                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('HomePage',style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontWeight: FontWeight.bold,fontSize: 15
                                      )),
                                      Text('www.souq.com',style: TextStyle(color: defaultColor),)
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>BuiltCard(context),
                    separatorBuilder: (context,index)=>SizedBox(height: 1,),
                    itemCount: 8
                ),
              )
            ],
          ),
        );
      },
    );
  }
  Widget BuiltCard(context){
    return           InkWell(
      onTap: (){
        navigatePush(context:context,widget: DetailsHome());
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height:30,width:30,child: Image.asset('images/Icon/egypt.png',)),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ahmed',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,fontSize: 15
                      ),),
                      Text('Cairo , Egypt',style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(height:30,width:30,child: Image.asset('images/Icon/new.png',)),
                      SizedBox(width: 10,),
                      Container(height:30,width:30,child: Image.asset('images/Icon/chat.png',)),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(height:30,width:30,child: Image.asset('images/Icon/schedule.png',)),

                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,fontSize: 15
                          )),
                          Text('15 Aug ,01:32:55',style: TextStyle(color: defaultColor),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(height:30,width:30,child: Image.asset('images/Icon/ip-address.png',)),
                      SizedBox(width: 5,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('IP',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,fontSize: 15
                          )),
                          Text('192.255.168.15',style: TextStyle(color: defaultColor),)
                        ],
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(height:35,width:35,child: Image.asset('images/Icon/browser.png',)),

                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Redirected',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,fontSize: 15
                          )),
                          Text('www.google.com',style: TextStyle(color: defaultColor),)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(height:30,width:30,child: Image.asset('images/Icon/globe.png',)),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('HomePage',style:Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,fontSize: 15
                          )),
                          Text('www.souq.com',style: TextStyle(color: defaultColor),)
                        ],
                      ),
                    ],
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );

  }
}
