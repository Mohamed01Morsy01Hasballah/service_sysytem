import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/LayoutApp.dart';
import 'package:service_system/Bloc/States.dart';
import 'package:service_system/Component/widgets.dart';
import 'package:service_system/Constant/Constant.dart';
import 'package:service_system/modules/Verfication.dart';

class StepScreen extends StatelessWidget {
  var name=TextEditingController();
  var namee=TextEditingController();

  var url=TextEditingController();
  var email=TextEditingController();

  var emaill=TextEditingController();

  var phone=TextEditingController();
  var text='Copy Copy Copy Copy Copy Copy Copy Copy';


  List<Step> getSteps(context)=>[
  Step(

    state:ServiceCubit.get(context).currentIndex>0?StepState.complete:StepState.indexed ,
    isActive: ServiceCubit.get(context).currentIndex>=0,
      title: Container(),
      content: Container(
        height: MediaQuery.of(context).size.height * .42,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: border,width: 0.5),
                          bottom: BorderSide(color: border,width: 0.5),

                          right:BorderSide(color: border,width: 0.5),
                          left: BorderSide(color: border,width: 0.5)
                      ),
                  ),
                  child: InkWell(
                    onTap: (){
                    ServiceCubit.get(context).ChangeDropDown();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${ServiceCubit.get(context).select} ',style: Theme.of(context).textTheme.subtitle1,),
                          ServiceCubit.get(context).dropdown?
                            Icon(Icons.arrow_drop_down_outlined):
                              Icon(Icons.arrow_drop_up_outlined)
                        ],
                      ),
                    ),
                  ),
                ),
                if(ServiceCubit.get(context).dropdown)
                Container(
                 height: 60,
                 child: ListView.separated(
                     itemBuilder: (context,index)=> Container(
                      height:40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                      color: Colors.grey
                      ),
                      child: InkWell(
                      onTap: (){
                      ServiceCubit.get(context).ChangeSelect(Language[index]);
                      },
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${Language[index]}',style: Theme.of(context).textTheme.subtitle1,),
                      ),
                      )
                        ),
                     separatorBuilder: (context,index)=>Container(width: double.infinity,height: 2,color:defaultColor ,),
                     itemCount: Language.length
                 ),
                ),
                Spacer(),


              ],
            )
          ),
        ),


  ),
  Step(
      state:ServiceCubit.get(context).currentIndex>1?StepState.complete:StepState.indexed ,

      isActive: ServiceCubit.get(context).currentIndex>=1,

      title: Container(),
      content: Container(
        height: MediaQuery.of(context).size.height * .42,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Property Details',style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 23,fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 15,),
              Text('Which Website Would you like to add a chat widget to ?',style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: 15,),

              BuiltTextField(
                  context: context,
                  label: 'Website name',
                  type: TextInputType.text,
                  controller: name,
                  prefix: Icons.adjust_outlined
              ),
              SizedBox(height: 15,),

              BuiltTextField(
                  context: context,

                  label: 'Website url',
                  type: TextInputType.text,
                  controller: url,
                  prefix: Icons.star_purple500_sharp
              ),
            ],
          ),
        ),
      )
  ),
  Step(
      state:ServiceCubit.get(context).currentIndex>2?StepState.complete:StepState.indexed ,

      isActive: ServiceCubit.get(context).currentIndex>=2,

      title: Container(),
      content: Container(
        height: MediaQuery.of(context).size.height * .42,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Install Widget',style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 23,fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 15,),
              Text('Which Website Would you like to add a chat widget to ?',style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: 15,),

              Container(
                padding: EdgeInsets.all(10),
                  color: Colors.grey,
                  child: Text(text,style: Theme.of(context).textTheme.subtitle1,)
              ),
              SizedBox(height: 15,),
              Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red
                ),
                child: MaterialButton(
                  
                    child: Text('Copy',style: TextStyle(color: Colors.white),),
                    onPressed: (){
                      ServiceCubit.get(context).ShowMessage();
                      Clipboard.setData(ClipboardData(text: text));
                    }
                ),
              ),
              SizedBox(height: 15,),
              BuiltTextField(
                  label: 'Enter Your Developer\'s Email here',
                  type: TextInputType.emailAddress,
                  controller: email,
                  prefix: Icons.email,
                context: context
              ),

            ],
          ),
        ),
      )
  ),
    Step(
        state:ServiceCubit.get(context).currentIndex>3?StepState.complete:StepState.indexed ,

        isActive: ServiceCubit.get(context).currentIndex>=3,

        title: Container(),
        content: SingleChildScrollView(
          child: Container(
          // height:MediaQuery.of(context).size.height *0.42 ,

            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Confirm Details',style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 25,fontWeight: FontWeight.bold,
                    )),
                    SizedBox(height: 15,),
                    BuiltTextField(
                        label: 'Full Name',
                        type: TextInputType.text,
                        controller: namee ,
                        prefix: Icons.person,
                        context: context

                    ),
                    SizedBox(height: 15,),
                    BuiltTextField(
                        label: 'Email',
                        type: TextInputType.emailAddress,
                        controller: emaill ,
                        prefix: Icons.email,
                        context: context

                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: border,width: 1),
                              bottom: BorderSide(color: border,width: 1),

                              right:BorderSide(color: border,width: 1),
                              left: BorderSide(color: border,width: 1)
                          )
                      ),
                      child: InkWell(
                        onTap: (){
                          ServiceCubit.get(context).ChangeChoosetwo();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [
                              Text(ServiceCubit.get(context).s,style: Theme.of(context).textTheme.subtitle1,),
                              Icon(Icons.arrow_drop_up_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    BuiltTextField(
                        label: 'Phone',
                        type: TextInputType.phone,
                        controller: phone ,
                        prefix: Icons.phone,
                        context: context

                    ),

                  ],
                ),

                if(ServiceCubit.get(context).choosetwo)
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      //color: Colors.grey,
                      height: 130,
                      child: Card(
                        elevation: 20,
                        child: Column(
                          children: [
                            if(ServiceCubit.get(context).choosetwo)
                              TextFormField(
                                // focusNode:ServiceCubit.get(context).focusNode,
                                //readOnly: true,
                                onTap: (){
                                  ServiceCubit.get(context).ChangeChoose();
                                },
                                controller:ServiceCubit.get(context).SelectCountry ,
                                decoration: InputDecoration(
                                    labelText:'Enter Country',
                                    labelStyle: TextStyle(color: defaultColor),

                                    prefixIcon: Icon(
                                        Icons.add_location,
                                    ),
                                    prefixIconColor: defaultColor,
                                    border:OutlineInputBorder()
                                ),
                                onChanged: (value){
                                  ServiceCubit.get(context).listItemEmpty.clear();
                                  Language.forEach((element) {
                                    var name=element.toLowerCase();
                                    if(name.contains(value)){
                                      ServiceCubit.get(context).changeAddListItem(element);
                                      if(value.isEmpty){
                                        ServiceCubit.get(context).listItemEmpty.clear();
                                      }
                                    }

                                  });
                                },
                              ),
                            ServiceCubit.get(context).choose?Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:  Colors.grey
                                ),
                                child: ListView.builder(
                                  itemBuilder: (context,index){
                                    return InkWell(
                                      onTap: (){
                                        ServiceCubit.get(context).listItemEmpty.isNotEmpty?
                                        ServiceCubit.get(context).changeSelectCountry(ServiceCubit.get(context).listItemEmpty[index]):
                                        ServiceCubit.get(context).changeSelectCountry(Language[index]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(color: Colors.white,width: 2)
                                            )
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            ServiceCubit.get(context).listItemEmpty.isNotEmpty?
                                            ServiceCubit.get(context).listItemEmpty[index]:
                                            Language[index] ,style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount:ServiceCubit.get(context).listItemEmpty.isNotEmpty?
                                  ServiceCubit.get(context).listItemEmpty.length:
                                  Language.length,
                                ),
                              ),
                            ):SizedBox(height: 2,)

                          ],
                        ),
                      ),
                    ),
                  ),
                Spacer(),



              ],
            ),
          ),
        )
    ),


  ];
  @override
  Widget build(BuildContext context) {
    namee.text='Mohamed';
    emaill.text='moh.morsy2211@gmail.com';
    phone.text='01099636041';


    return BlocProvider(
      create: (context)=>ServiceCubit()..changeFocusNode(),
      child: BlocConsumer<ServiceCubit,ServiceStates>(
        listener: (context,state){
          if( state is ShowMessageState){
            ShowToast(text: 'copy', state: ToastState.Success);
          }
        },
        builder: (context,state){
          var cubit=ServiceCubit.get(context);
          Size size=MediaQuery.of(context).size;
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Image.asset(
                      "images/QFI logo .png",
                      fit: BoxFit.contain,
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      color: defaultColor,

                    ),
                    SizedBox(height: 10,),
                    Text('Welcome to your dashboard, let\'s ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )),
                    SizedBox(height: 6,),

                    Text('get you stepup in4 easy steps. ',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        )),

                    //get you stepup in4 easy steps.
                    SizedBox(height: 10,),

                    Expanded(
                      child: Theme(

                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(primary: defaultColor),
                          canvasColor: Theme.of(context).scaffoldBackgroundColor,
                          cardColor: Theme.of(context).scaffoldBackgroundColor



                        ),
                        child: Container(
                          child: Stepper
                            (



                       //  physics: NeverScrollableScrollPhysics(),
                            elevation: 0,

                           controlsBuilder:(context,details) {
                             return Container(
                               child: Row(
                                 children: [
                                   TextButton(
                                       onPressed: details.onStepCancel,
                                     child: Text('Previous',style: TextStyle(color: defaultColor,fontSize:15,fontWeight: FontWeight.bold),),
                                   ),
                                   Spacer(),
                                   TextButton(
                                     onPressed: details.onStepContinue,
                                     child: Text('Next',style: TextStyle(color: defaultColor,fontSize:15,fontWeight: FontWeight.bold),),
                                   ),

                                 ],
                               ),
                             );
                           } ,
                            onStepTapped: (step){
                             cubit.changeSettper(step);
                            },
                            type: StepperType.horizontal,
                            steps: getSteps(context),
                            currentStep: cubit.currentIndex,
                            onStepContinue: (){

                              if(cubit.currentIndex>=getSteps(context).length-1){
                                navigatePush(context: context,widget:LayoutApp() );

                              }else {
                                cubit.onStepIncrease();
                              }
                            },
                            onStepCancel: (){
                              if(cubit.currentIndex<=0){
                                navigatePush(context: context,widget:Verfication() );
                              }
                              else {
                             cubit.onStepDecrease();
                           }
                            },
                          ),
                        ),
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
