import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../Constant/Constant.dart';

class HomeTwo extends StatelessWidget {
  const HomeTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60,),
          Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text('Hi,Antonio',style: TextStyle(
                  fontSize: 24,fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10,),

                Text('What Would you like to learn '),
                Text('today? Search below')

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            child: Container(
            //  height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    Spacer(),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(10)

                      ),
                      child: Icon(Icons.search,color:Colors.white ,),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('NEW QUIZ',style: TextStyle(fontSize: 20),),
                    Spacer(),
                    TextButton(
                        onPressed: (){},
                        child: Text('View All',style: TextStyle(fontSize: 17,color: defaultColor))
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  //width: size.width *0.7,
                  height: size.height *0.4,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>BuiltItemRow(context),
                      separatorBuilder: (context,index)=>SizedBox(width: 20,),
                      itemCount: 3
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget BuiltItemRow(context){
    Size size=MediaQuery.of(context).size;

    return Container(
      color: Colors.grey[300],

      width: size.width *0.7,
      height: size.height *0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            ),
            child: FancyShimmerImage(
              width: double.infinity,
              height: size.height *0.2,
              boxFit: BoxFit.fill,
              imageUrl: 'https://thumbs.dreamstime.com/z/composite-image-online-chat-text-speech-bubble-online-chat-text-speech-bubble-against-back-view-businessman-98541064.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric( vertical: 40.0,horizontal: 10),
            child: Text('Biology & the  Scientific Method And Physic'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('150\$'),
          )



        ],
      ),
    );
  }

}
