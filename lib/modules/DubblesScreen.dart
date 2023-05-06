import 'package:bubble_chart/bubble_chart.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

class Dubbles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:Container(
          color: Colors.red,
          height: size.height *0.22,
          child: Stack(
            children: [
            Positioned(
              bottom: size.height * 0.08,
              left: size.width * 0.6,
              child: Container(
                height: size.height * .18,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300]!.withOpacity(0.7)
                ),
              ),
            ),
              Positioned(
                bottom: size.height * 0.09,
                right: size.width * 0.6,
                child: Container(
                  height: size.height * .18,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.7)
                  ),
                ),
              ),
              Positioned(
                top:size.height * 0.13,
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


            ],
          ),
        )

      ),
    );
  }
  var root = BubbleNode.node(

    padding: 0,
    children: [
      BubbleNode.leaf(
          value: 9876,
          options:BubbleOptions(
              color: Colors.red
          )
      ),
      BubbleNode.leaf(
          value: 4688,
          options:BubbleOptions(
              color: Colors.red
          )
      ),


    ]
  );


}
