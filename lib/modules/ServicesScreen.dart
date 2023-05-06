import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:service_system/Component/widgets.dart';
import 'package:service_system/modules/ServiceDetails.dart';

import '../Constant/Constant.dart';

class ServicesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Services'),
        centerTitle: true,
        backgroundColor: defaultColor,

      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 20,
                child: Column(
                  children: [
                    Container(
                      color:defaultColor,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Basic',style:TextStyle(color: Colors.white,fontSize: 23),))),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.3,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
                          ),
                          SizedBox(height: 10,),
                          Text('Our Free SSL ensures that visitor data (credit cards ,passwords ,etc) is secure and protected.. but you can take it to the next level'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  navigatePush(context:context,widget: ServiceDetails());
                                },
                                  child: Text('Details',style: TextStyle(color: defaultColor),)),
                              Row(
                                children: [
                                  Icon(Icons.shopping_cart),
                                  SizedBox(width: 10,),
                                  Text('Add to Cart')
                                ],
                              ),
                              Icon(Icons.share,color: defaultColor,)

                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color:Colors.deepOrange,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Price : 153.5 / Month',style:TextStyle(color: Colors.white,fontSize: 23),))),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 20,
                child: Column(
                  children: [
                    Container(
                        color:defaultColor,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Intermediate',style:TextStyle(color: Colors.white,fontSize: 23),))),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.3,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
                          ),
                          SizedBox(height: 10,),
                          Text('Our Free SSL ensures that visitor data (credit cards ,passwords ,etc) is secure and protected.. but you can take it to the next level'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: (){
                                    navigatePush(context:context,widget: ServiceDetails());
                                  },
                                  child: Text('Details',style: TextStyle(color: defaultColor),)),
                              Row(
                                children: [
                                  Icon(Icons.shopping_cart),
                                  SizedBox(width: 10,),
                                  Text('Add to Cart')
                                ],
                              ),
                              Icon(Icons.share,color: defaultColor,)

                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color:Colors.deepOrange,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Price : 153.5 / Month',style:TextStyle(color: Colors.white,fontSize: 23),))),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 20,
                child: Column(
                  children: [
                    Container(
                        color:defaultColor,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Advanced',style:TextStyle(color: Colors.white,fontSize: 23),))),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.3,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
                          ),
                          SizedBox(height: 10,),
                          Text('Our Free SSL ensures that visitor data (credit cards ,passwords ,etc) is secure and protected.. but you can take it to the next level'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: (){
                                    navigatePush(context:context,widget: ServiceDetails());
                                  },
                                  child: Text('Details',style: TextStyle(color: defaultColor),)),
                              Row(
                                children: [
                                  Icon(Icons.shopping_cart),
                                  SizedBox(width: 10,),
                                  Text('Add to Cart')
                                ],
                              ),
                              Icon(Icons.share,color: defaultColor,)

                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color:Colors.deepOrange,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Price : 153.5 / Month',style:TextStyle(color: Colors.white,fontSize: 23),))),


                  ],
                ),
              ),
              SizedBox(height: 10,),
              Card(
                elevation: 20,
                child: Column(
                  children: [
                    Container(
                        color:defaultColor,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Super',style:TextStyle(color: Colors.white,fontSize: 23),))),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.3,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
                          ),
                          SizedBox(height: 10,),
                          Text('Our Free SSL ensures that visitor data (credit cards ,passwords ,etc) is secure and protected.. but you can take it to the next level'),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.grey,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: (){
                                    navigatePush(context:context,widget: ServiceDetails());
                                  },
                                  child: Text('Details',style: TextStyle(color: defaultColor),)),
                              Row(
                                children: [
                                  Icon(Icons.shopping_cart),
                                  SizedBox(width: 10,),
                                  Text('Add to Cart')
                                ],
                              ),
                              Icon(Icons.share,color: defaultColor,)

                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        color:Colors.deepOrange,
                        height: 60,
                        width: double.infinity,
                        child: Center(child: Text('Price : 153.5 / Month',style:TextStyle(color: Colors.white,fontSize: 23),))),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
