import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_system/Constant/Constant.dart';
import 'package:service_system/modules/StepsScreen.dart';
import 'package:service_system/modules/Verfication.dart';

import '../Component/CurveCliper.dart';
import '../Component/widgets.dart';

class RegisterScreen extends StatelessWidget {
  var name= TextEditingController();
  var email=TextEditingController();
  var pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color:Theme.of(context).scaffoldBackgroundColor,
          child: Column(
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
                         // color:  Theme.of(context).primaryColor,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    HexColor('#140529'),
                                    HexColor('#061892')

                                  ]
                              )

                          ),

                        )
                    ),
                  ),
                  Container(
                   //color:  Theme.of(context).primaryColor,
                    child:SizedBox(
                      height: 80,
                      child: Image.asset(
                        "images/QFI logo .png",
                        fit: BoxFit.contain,
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                       // color: Colors.white,
//
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Sign Up',
                      style: TextStyle(
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          color:Theme.of(context).textTheme.bodyText2!.color
                      ),),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: CardTheme.of(context).color,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Card(
                        elevation: 20,

                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BuiltTextField(
                                  label: 'Name',
                                  type: TextInputType.name,
                                  controller: name,
                                  prefix: Icons.person,
                                  context: context

                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BuiltTextField(
                                  label: 'Email',
                                  type: TextInputType.emailAddress,
                                  controller: email,
                                  prefix: Icons.email,
                                  context: context

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BuiltTextField(
                                  label: 'password',
                                  type: TextInputType.visiblePassword,
                                  controller: pass,
                                  prefix: Icons.lock,
                                  context: context

                              ),
                            ),

                          ],
                        ),

                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                HexColor('#140529'),
                                HexColor('#061892')

                              ]
                          )

                        //color: Theme.of(context).primaryColor
                      ),
                      child: MaterialButton(

                          onPressed: (){
                            // navigatePush(context:context,widget: StepScreen());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Verfication()));
                          },
                          child: Text('Next',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
                      ),
                    ),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
