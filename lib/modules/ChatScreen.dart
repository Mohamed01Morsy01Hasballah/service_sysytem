import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class ChatScreen extends StatelessWidget {
 var text=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return BlocProvider(
      create: (context)=>ServiceCubit(),

      child: BlocConsumer<ServiceCubit,ServiceStates>(
        listener: (context,index){},
        builder: (context,index){
          var cubit=ServiceCubit.get(context);
          return SafeArea(
            child: Scaffold(

            body: Column(
              textDirection: TextDirection.ltr,

              crossAxisAlignment: CrossAxisAlignment.start,
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
                      textDirection: TextDirection.ltr,
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
                            child:               Row(
                              textDirection: TextDirection.ltr,

                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(height:30,width:30,child: Image.asset('images/Icon/egypt.png',)),
                                SizedBox(width: 10,),
                                Column(
                                  textDirection: TextDirection.ltr,

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ahmed',
                                        style: TextStyle(fontSize: 17,color: Colors.white)),
                                    Text('Cairo , Egypt',style: TextStyle(color: Colors.white,fontSize: 12),)
                                  ],
                                ),
                                Spacer(),
                                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined,color: Colors.white,))
                              ],
                            ),

                          ),
                        ),
                        Positioned(
                          bottom:50 ,
                          left: 15,
                          right: 15,
                          child: Row(
                            textDirection: TextDirection.ltr,

                            children: [
                              Row(
                                textDirection: TextDirection.ltr,

                                children: [
                                  Container(height:20,width:20,child: Image.asset('images/Icon/clock.png',)),
                                  SizedBox(width: 5,),
                                  Text('04:50',style: TextStyle(fontSize: 20,color: Colors.blue),),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Container(height:25,width:25,color:Colors.grey.withOpacity(0.7), child: Image.asset('images/Icon/mute.png',color: Colors.white,)),
                                  SizedBox(height: 5,),
                                  Text(' mute',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                                ],
                              ),


                            ],
                          ),
                        ),
                        Positioned(
                          bottom:8 ,
                          left: 15,
                          right: 15,
                          child: Row(
                            textDirection: TextDirection.ltr,

                            children: [
                              Column(
                                textDirection: TextDirection.ltr,

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Last Visit ',style: TextStyle(fontSize: 17,color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Text('10 Aug , 01:33:40 ',style: TextStyle(color: Colors.white,fontSize: 12,),)
                                ],
                              ),
                              Spacer(),
                              Row(
                               textDirection: TextDirection.ltr,

                                children: [
                                  Text(' Visited ',style: TextStyle(fontSize: 17,color: Colors.white),),
                                  SizedBox(width: 10,),
                                  Text('30',style: TextStyle(fontSize: 17,color: Colors.red))

                                ],
                              )



                            ],
                          ),
                        ),






                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Container(
                      color: Colors.black12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('friday 15/9/21',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index)=>                Container(
                          decoration: BoxDecoration(
                            //  color: Colors.blue,

                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 400,
                              child: Column(
                                textDirection:TextDirection.rtl ,

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cubit.messages[index]),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      Text('1:37 PM'),
                                      SizedBox( width:  5,),
                                      Text('sent_by user adel '),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        separatorBuilder: (context,index)=>SizedBox(height: 10,),
                        itemCount: cubit.messages.length
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          IconButton(onPressed:(){}, icon: Icon(Icons.add,size: 30,color: Colors.white,)),
                          SizedBox(width: 10,),
                          Expanded(
                            child: TextFormField(
                              textDirection: TextDirection.ltr,
                              controller: text,
                              decoration: InputDecoration(
                                   hintTextDirection: TextDirection.ltr ,
                                  hintText: 'Enter Message',
                                  border: InputBorder.none

                              ),


                            ),
                          ),
                          SizedBox(width: 10,),
                          IconButton(onPressed:(){},icon: Container(height:30,width:30, child: Image.asset('images/Icon/audio.png',color: Colors.red,))),
                          SizedBox(width: 10,),
                          IconButton(onPressed:(){
                            cubit.SendMessage(text.text);
                          },

                              icon: Icon(Icons.send,size: 30,color: Colors.red,textDirection: TextDirection.ltr,))
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
