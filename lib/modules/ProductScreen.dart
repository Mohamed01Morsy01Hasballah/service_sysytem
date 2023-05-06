import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';

import '../Constant/Constant.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>ServiceCubit(),

      child: BlocConsumer<ServiceCubit,ServiceStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=ServiceCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              title: Text('Products'),
              centerTitle: true,
              backgroundColor: defaultColor,

            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.2,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Chat ',style: TextStyle(fontSize: 20),),
                                    Text('21/2/2021 ',),

                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text('This is Short description about this products This is short description about this products about this products this'),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Status',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('Available',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Price',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('1500',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: defaultColor,
                                  width: 80,
                                  height: 40,
                                  child: MaterialButton(
                                    onPressed: (){},
                                    child: Text('Buy',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                  cubit.AddProduct(1);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      cubit.addOne?
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart,color: defaultColor,),
                                          Text('Added',style: TextStyle(color: defaultColor),),
                                        ],
                                      ):
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart),
                                          Text('Add To Plan'),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(context: context, builder: (context)=>
                                    Center(
                                      child: SingleChildScrollView(
                                          child: AlertDialog(
                                            elevation: 20,

                                            backgroundColor: Theme.of(context).cardColor,
                                            iconPadding: EdgeInsets.all(0),
                                            contentPadding: EdgeInsets.all(10),
                                            icon: Container(
                                              height: 40,
                                                width: 40,
                                                child: Image.asset('images/Icon/egypt.png')),

                                            title: Text('Suggest',style:  Theme.of(context).textTheme.bodyLarge,),
                                            content: Container(
                                           //   color: Colors.grey[300],
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 150,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context).cardColor,
                                                      border: Border(
                                                        bottom: BorderSide(color:Colors.grey,width: 2),
                                                          top: BorderSide(color:Colors.grey,width: 2),
                                                left: BorderSide(color:Colors.grey,width: 2),
                                              right: BorderSide(color:Colors.grey,width: 2)

                                                      )
                                                    ),
                                                    width: double.infinity,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                          hintText: 'Enter Your Suggestion',
                                                          border: InputBorder.none
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Row(
                                                    children: [
                                                      Spacer(),
                                                      TextButton(onPressed: (){
                                                        Navigator.pop(context);
                                                      }, child: Text('Send',style: TextStyle(fontSize: 20,color: defaultColor),))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                      ),
                                    )
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.lightbulb),
                                      Text('Suggest')
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.2,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://images.pexels.com/photos/3182774/pexels-photo-3182774.jpeg?auto=compress&cs=tinysrgb&w=600https://images.pexels.com/photos/3182774/pexels-photo-3182774.jpeg?auto=compress&cs=tinysrgb&w=600',
                          ),

                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Web Development ',style: TextStyle(fontSize: 20),),
                                    Text('21/2/2021 ',),

                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text('This is Short description about this products This is short description about this products about this products this'),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Status',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('Available',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Price',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('1500',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: defaultColor,
                                  width: 80,
                                  height: 40,
                                  child: MaterialButton(
                                    onPressed: (){},
                                    child: Text('Buy',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    cubit.AddProduct(2);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      cubit.addTwo?
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart,color: defaultColor,),
                                          Text('Added',style: TextStyle(color: defaultColor),),
                                        ],
                                      ):
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart),
                                          Text('Add To Plan'),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(context: context, builder: (context)=>
                                        Center(
                                          child: SingleChildScrollView(
                                            child: AlertDialog(
                                              elevation: 20,
                                              backgroundColor: Colors.grey[300],
                                              iconPadding: EdgeInsets.all(0),
                                              contentPadding: EdgeInsets.all(10),
                                              icon: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset('images/Icon/egypt.png')),

                                              title: Text('Suggest'),
                                              content: Container(
                                                color: Colors.grey[300],
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(color:Colors.grey,width: 2),
                                                              top: BorderSide(color:Colors.grey,width: 2),
                                                              left: BorderSide(color:Colors.grey,width: 2),
                                                              right: BorderSide(color:Colors.grey,width: 2)

                                                          )
                                                      ),
                                                      width: double.infinity,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: TextFormField(
                                                          decoration: InputDecoration(
                                                              hintText: 'Enter Your Suggestion',
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                      children: [
                                                        Spacer(),
                                                        TextButton(onPressed: (){
                                                          Navigator.pop(context);
                                                        }, child: Text('Send',style: TextStyle(fontSize: 20,color: defaultColor),))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ),
                                        )
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.lightbulb),
                                      Text('Suggest')
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.2,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://images.pexels.com/photos/109371/pexels-photo-109371.jpeg?auto=compress&cs=tinysrgb&w=600',
                          ),

                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Perfume ',style: TextStyle(fontSize: 20),),
                                    Text('21/2/2021 ',),

                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text('This is Short description about this products This is short description about this products about this products this'),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Status',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('Available',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Price',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('1500',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: defaultColor,
                                  width: 80,
                                  height: 40,
                                  child: MaterialButton(
                                    onPressed: (){},
                                    child: Text('Buy',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    cubit.AddProduct(3);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      cubit.addThree?
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart,color: defaultColor,),
                                          Text('Added',style: TextStyle(color: defaultColor),),
                                        ],
                                      ):
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart),
                                          Text('Add To Plan'),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(context: context, builder: (context)=>
                                        Center(
                                          child: SingleChildScrollView(
                                            child: AlertDialog(
                                              elevation: 20,
                                              backgroundColor: Colors.grey[300],
                                              iconPadding: EdgeInsets.all(0),
                                              contentPadding: EdgeInsets.all(10),
                                              icon: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset('images/Icon/egypt.png')),

                                              title: Text('Suggest'),
                                              content: Container(
                                                color: Colors.grey[300],
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(color:Colors.grey,width: 2),
                                                              top: BorderSide(color:Colors.grey,width: 2),
                                                              left: BorderSide(color:Colors.grey,width: 2),
                                                              right: BorderSide(color:Colors.grey,width: 2)

                                                          )
                                                      ),
                                                      width: double.infinity,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: TextFormField(
                                                          decoration: InputDecoration(
                                                              hintText: 'Enter Your Suggestion',
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                      children: [
                                                        Spacer(),
                                                        TextButton(onPressed: (){
                                                          Navigator.pop(context);
                                                        }, child: Text('Send',style: TextStyle(fontSize: 20,color: defaultColor),))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ),
                                        )
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.lightbulb),
                                      Text('Suggest')
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.2,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://images.pexels.com/photos/5496464/pexels-photo-5496464.jpeg?auto=compress&cs=tinysrgb&w=600',
                          ),

                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Code Testing ',style: TextStyle(fontSize: 20),),
                                    Text('21/2/2021 ',),

                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text('This is Short description about this products This is short description about this products about this products this'),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Status',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('Available',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Price',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('1500',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: defaultColor,
                                  width: 80,
                                  height: 40,
                                  child: MaterialButton(
                                    onPressed: (){},
                                    child: Text('Buy',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    cubit.AddProduct(4);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      cubit.addFour?
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart,color: defaultColor,),
                                          Text('Added',style: TextStyle(color: defaultColor),),
                                        ],
                                      ):
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart),
                                          Text('Add To Plan'),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(context: context, builder: (context)=>
                                        Center(
                                          child: SingleChildScrollView(
                                            child: AlertDialog(
                                              elevation: 20,
                                              backgroundColor: Colors.grey[300],
                                              iconPadding: EdgeInsets.all(0),
                                              contentPadding: EdgeInsets.all(10),
                                              icon: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset('images/Icon/egypt.png')),

                                              title: Text('Suggest'),
                                              content: Container(
                                                color: Colors.grey[300],
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(color:Colors.grey,width: 2),
                                                              top: BorderSide(color:Colors.grey,width: 2),
                                                              left: BorderSide(color:Colors.grey,width: 2),
                                                              right: BorderSide(color:Colors.grey,width: 2)

                                                          )
                                                      ),
                                                      width: double.infinity,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: TextFormField(
                                                          decoration: InputDecoration(
                                                              hintText: 'Enter Your Suggestion',
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                      children: [
                                                        Spacer(),
                                                        TextButton(onPressed: (){
                                                          Navigator.pop(context);
                                                        }, child: Text('Send',style: TextStyle(fontSize: 20,color: defaultColor),))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ),
                                        )
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.lightbulb),
                                      Text('Suggest')
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),

                    Card (
                      elevation: 20,
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.2,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://images.pexels.com/photos/3182774/pexels-photo-3182774.jpeg?auto=compress&cs=tinysrgb&w=600https://images.pexels.com/photos/3182774/pexels-photo-3182774.jpeg?auto=compress&cs=tinysrgb&w=600',
                          ),

                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Realtime Connection ',style: TextStyle(fontSize: 20),),
                                    Text('21/2/2021 ',),

                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text('This is Short description about this products This is short description about this products about this products this'),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Status',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('Available',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Price',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('1500',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: defaultColor,
                                  width: 80,
                                  height: 40,
                                  child: MaterialButton(
                                    onPressed: (){},
                                    child: Text('Buy',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    cubit.AddProduct(5);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      cubit.addFive?
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart,color: defaultColor,),
                                          Text('Added',style: TextStyle(color: defaultColor),),
                                        ],
                                      ):
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart),
                                          Text('Add To Plan'),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(context: context, builder: (context)=>
                                        Center(
                                          child: SingleChildScrollView(
                                            child: AlertDialog(
                                              elevation: 20,
                                              backgroundColor: Colors.grey[300],
                                              iconPadding: EdgeInsets.all(0),
                                              contentPadding: EdgeInsets.all(10),
                                              icon: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset('images/Icon/egypt.png')),

                                              title: Text('Suggest'),
                                              content: Container(
                                                color: Colors.grey[300],
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(color:Colors.grey,width: 2),
                                                              top: BorderSide(color:Colors.grey,width: 2),
                                                              left: BorderSide(color:Colors.grey,width: 2),
                                                              right: BorderSide(color:Colors.grey,width: 2)

                                                          )
                                                      ),
                                                      width: double.infinity,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: TextFormField(
                                                          decoration: InputDecoration(
                                                              hintText: 'Enter Your Suggestion',
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                      children: [
                                                        Spacer(),
                                                        TextButton(onPressed: (){
                                                          Navigator.pop(context);
                                                        }, child: Text('Send',style: TextStyle(fontSize: 20,color: defaultColor),))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ),
                                        )
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.lightbulb),
                                      Text('Suggest')
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          FancyShimmerImage(
                            width: double.infinity,
                            height: size.height *0.2,
                            boxFit: BoxFit.fill,
                            imageUrl: 'https://images.pexels.com/photos/6476191/pexels-photo-6476191.jpeg?auto=compress&cs=tinysrgb&w=600',
                          ),

                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Digital Marketing ',style: TextStyle(fontSize: 20),),
                                    Text('21/2/2021 ',),

                                  ],
                                ),
                                SizedBox(height: 20,),
                                Text('This is Short description about this products This is short description about this products about this products this'),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Status',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('Available',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('Price',style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 10,),
                                        Text('1500',style: TextStyle(
                                            color: defaultColor
                                        ),)
                                      ],
                                    )

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: defaultColor,
                                  width: 80,
                                  height: 40,
                                  child: MaterialButton(
                                    onPressed: (){},
                                    child: Text('Buy',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    cubit.AddProduct(6);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      cubit.addSix?
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart,color: defaultColor,),
                                          Text('Added',style: TextStyle(color: defaultColor),),
                                        ],
                                      ):
                                      Column(
                                        children: [
                                          Icon(Icons.add_chart),
                                          Text('Add To Plan'),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    showDialog(context: context, builder: (context)=>
                                        Center(
                                          child: SingleChildScrollView(
                                            child: AlertDialog(
                                              elevation: 20,
                                              backgroundColor: Colors.grey[300],
                                              iconPadding: EdgeInsets.all(0),
                                              contentPadding: EdgeInsets.all(10),
                                              icon: Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset('images/Icon/egypt.png')),

                                              title: Text('Suggest'),
                                              content: Container(
                                                color: Colors.grey[300],
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom: BorderSide(color:Colors.grey,width: 2),
                                                              top: BorderSide(color:Colors.grey,width: 2),
                                                              left: BorderSide(color:Colors.grey,width: 2),
                                                              right: BorderSide(color:Colors.grey,width: 2)

                                                          )
                                                      ),
                                                      width: double.infinity,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: TextFormField(
                                                          decoration: InputDecoration(
                                                              hintText: 'Enter Your Suggestion',
                                                              border: InputBorder.none
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 20,),
                                                    Row(
                                                      children: [
                                                        Spacer(),
                                                        TextButton(onPressed: (){
                                                          Navigator.pop(context);
                                                        }, child: Text('Send',style: TextStyle(fontSize: 20,color: defaultColor),))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ),
                                        )
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.lightbulb),
                                      Text('Suggest')
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          );
        },

      ),
    );
  }
}
//digital
//https://images.pexels.com/photos/6476191/pexels-photo-6476191.jpeg?auto=compress&cs=tinysrgb&w=600
//code testing
//
//chat
//https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg
//perfume
//
//web development
//