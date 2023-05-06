import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:service_system/Bloc/LayoutApp.dart';
import 'package:service_system/Component/widgets.dart';
import 'package:service_system/Constant/Constant.dart';
import 'package:service_system/modules/ForgetPassword.dart';
import 'package:service_system/modules/RegisterScreen.dart';

import '../Component/CurveCliper.dart';

class LoginScreen extends StatelessWidget {
  var email=TextEditingController();
  var pass=TextEditingController();

  //

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
                          decoration: BoxDecoration(
                            //color: Theme.of(context).primaryColor
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    HexColor('#140529'),
                                    HexColor('#061892')

                                  ]
                              )

                          ),
                         // color:  Theme.of(context).primaryColor,
                        )
                    ),
                  ),
                  Container(
                    child: SizedBox(
                      height: 80,
                      child: Image.asset(
                        "images/QFI logo .png",
                        fit: BoxFit.contain,
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                        //color: Colors.white,

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
                    Text('Login',
                      style: TextStyle(
                          fontSize: 37,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          color: Theme.of(context).textTheme.bodyText2!.color
                      ),),
                    SizedBox(height: 10,),
                    Container(

                      width: double.infinity,
                      decoration: BoxDecoration(

                          color:CardTheme.of(context).color,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Card(
                        elevation: 20,

                        child: Column(
                          children: [
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
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Forget Password ',style: Theme.of(context).textTheme.subtitle2,),
                        TextButton(
                            onPressed: (){
                              navigatePush(context:context,widget: ForgetPassword());
                            },
                            child: Text('Recover',style: TextStyle(fontSize: 20,color: defaultColor,fontWeight: FontWeight.bold),)
                        )
                      ],
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

                        // color: Theme.of(context).primaryColor
                      ),
                      child: MaterialButton(

                          onPressed: (){
                            navigatePush(context: context,widget: LayoutApp());

                          },
                          child: Text('Login',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold))
                      ),
                    ),
                    SizedBox(height: 20,),

                    TextButton(
                        onPressed: (){
                          navigatePush(context: context,widget: RegisterScreen());
                        },
                        child: Text('Create New Acount',style: TextStyle(fontSize: 17,color:defaultColor,fontWeight: FontWeight.bold),)
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
