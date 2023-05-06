import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/Constant/Constant.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('Features',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Spacer(),
                  TextButton(
                      onPressed: (){},
                      child: Text('SEE ALL',style: TextStyle(fontSize: 17,color: defaultColor,fontWeight: FontWeight.bold))
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
               // width: size.width *0.27,
                height: size.height *0.3,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>BuiltItemRow(context),
                    separatorBuilder: (context,index)=>SizedBox(width: 10,),
                    itemCount: 3
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Categories',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
              ),
              Row(
                children: [
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                  Expanded(child: BuiltItem(context)),
                  SizedBox(width: 10,),
                ],
              ),




            ],
          ),
        ),
      ),
    );
  }
  Widget BuiltItemRow(context){
    Size size=MediaQuery.of(context).size;

    return Container(
      width: size.width *0.3,
      height: size.height *0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FancyShimmerImage(
              width: double.infinity,
              height: size.height *0.2,
              boxFit: BoxFit.fill,
              imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text('Business Management',style: TextStyle(height: 1.0,fontWeight: FontWeight.bold),),
          ),
          Row(
            children: [
              Text('\$150',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              SizedBox(width: 10,),
              Text('\$190',
           style: TextStyle(
               color: Colors.grey,
              decoration:TextDecoration.lineThrough
            ),
              ),

            ],
          )



        ],
      ),
    );
  }
  Widget BuiltItem(context){
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 35,
            backgroundImage:AssetImage('images/Icon/egypt.png') ,
          ),
        ),
        SizedBox(height: 20,),
        Text('Business',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),


      ],
    );
  }
}
