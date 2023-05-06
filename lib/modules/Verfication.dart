import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/Component/widgets.dart';
import 'package:service_system/Constant/Constant.dart';
import 'package:service_system/modules/Button.dart';
import 'package:service_system/modules/RegisterScreen.dart';
import 'package:service_system/modules/StepsScreen.dart';

import '../Component/CurveCliper.dart';

class Verfication extends StatelessWidget {
  var verify=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        // color: Colors.white,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: size.height *0.3,
                  width: double.infinity,
                  child: ClipPath(
                      clipper: CurveCliper(),
                      child:Container(
                        color: defaultColor,
                      )
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: SizedBox(
                    height: 80,
                    child: TextLiquidFill(
                      text: ' Verification Code',
                      waveColor: Colors.blueAccent,
                      boxBackgroundColor: defaultColor,
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),

                      boxHeight: 80.0,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: BuiltTextField(
                  label: 'Enter Verification Code',

                  type: TextInputType.emailAddress,
                  controller: verify,
                  prefix: Icons.add_alarm_outlined,
                  context: context
              ),
            ),
            SizedBox(height: 20,),

            Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: defaultColor

                ),
                child: MaterialButton(
                  onPressed: (){
                    Future.delayed(Duration(milliseconds: 10),()async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StepScreen()));

                    });

                  },
                  child: Text('Contiune',style: TextStyle(color: Colors.white,fontSize: 20),),

                )
            ),



          ],
        ),
      ),
    );
  }
}
