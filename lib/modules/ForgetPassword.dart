import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_system/Component/widgets.dart';
import 'package:service_system/modules/RegisterScreen.dart';

import '../Component/CurveCliper.dart';
import '../Constant/Constant.dart';

class ForgetPassword extends StatelessWidget {
 var email=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color:Theme.of(context).scaffoldBackgroundColor,
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
                      // width: double.infinity,
                      child: TextLiquidFill(
                        text: 'Forget Password',
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

              Icon(Icons.lock,size: 80,color:IconTheme.of(context).color,
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: BuiltTextField(
                    label: 'Enter Email',
                    type: TextInputType.emailAddress,
                    controller: email,
                    prefix: Icons.email,
                    context: context

                ),
              ),
              SizedBox(height: 20,),

              Container(
                  width: 80,
                  height: 40,
                  color: defaultColor,
                  child: MaterialButton(
                    onPressed: (){},
                    child: Text('Send',style: TextStyle(color: Colors.white),),
                  )
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have Acount ?',style:Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 18),),
                  SizedBox(width: 10,),
                  TextButton(
                      onPressed: (){
                        navigateFininsh(context: context,Widget: RegisterScreen());
                      },
                      child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: defaultColor),)
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
