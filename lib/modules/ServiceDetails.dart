import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../Constant/Constant.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({Key? key}) : super(key: key);

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
        title: Text('Service Details'),
        centerTitle: true,
        backgroundColor: defaultColor,

      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Icon(Icons.share)
                        ],
                      ),
                      SizedBox(height:10 ,),
                      FancyShimmerImage(
                        width: double.infinity,
                        height: size.height *0.3,
                        boxFit: BoxFit.fill,
                        imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
                      ),
                      Center(child: Text('Basic',style: TextStyle(fontSize: 20),)),
                      SizedBox(height: 20,),
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
                          Text('property1'),
                          Icon(Icons.check_circle,color: Colors.green,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('property2'),
                          Icon(Icons.check_circle,color: defaultColor,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('property3'),
                          Text('5')
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('property4'),
                          Text('string value')
                        ],
                      ),
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
                          Text('153.5 / Month',style: TextStyle(color: defaultColor),),
                          Row(children: [
                            Icon(Icons.shopping_cart,color: defaultColor,),
                            Text('Add to Cart',style: TextStyle(color: defaultColor),)
                          ],)
                        ],
                      )




                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: size.height *0.7,
              child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>BuiltItem(context),
                  separatorBuilder: (context,index)=>SizedBox(width:10 ,),
                  itemCount: 5
              ),
            )

          ],
        ),
      ) ,

    );
  }
  Widget BuiltItem(context){
    Size size=MediaQuery.of(context).size;
    return                    Container(
      height: size.height* 0.7,
      width: size.width,

      child: Card(
        elevation: 20,
        child: Column(
          children: [
            Container(
                color:defaultColor,
                height: 60,
                width: double.infinity,
                child: Center(child: Text('Basic',style:TextStyle(color: Colors.white,fontSize: 23),))),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          Text('Add to cart')
                        ],
                      ),
                      Icon(Icons.share)
                    ],
                  ),
                  SizedBox(height: 10,),
                  FancyShimmerImage(
                    width: double.infinity,
                    height: size.height *0.3,
                    boxFit: BoxFit.fill,
                    imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
                  ),
                  SizedBox(height: 10,),
                  Text('Our Free SSL ensures that visitor data (credit cards ,passwords ,etc) is secure and protected.. but you can take it to the next level'),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color:defaultColor,
                        height: 40,
                        width: 100,
                        child: MaterialButton(
                          onPressed: (){},
                          child: Text('Details',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      Container(
                        color: defaultColor,
                        height: 40,
                        width: 150,
                        child: MaterialButton(
                          onPressed: (){},
                          child: Text('More Plans',style: TextStyle(color: Colors.white),),
                        ),
                      ),

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
    );


  }
}
