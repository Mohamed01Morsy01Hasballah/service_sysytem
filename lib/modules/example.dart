import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/Cubit.dart';
import 'package:service_system/Bloc/States.dart';

import '../Constant/Constant.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ServiceCubit(),
      child: BlocConsumer<ServiceCubit,ServiceStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=ServiceCubit.get(context);
          return  Scaffold(
            appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height:ServiceCubit.get(context).choosetwo?200:50 ,
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.grey,width: 2),
                                bottom: BorderSide(color: Colors.grey,width: 2),

                                right:BorderSide(color: Colors.grey,width: 2),
                                left: BorderSide(color: Colors.grey,width: 2)
                            )
                        ),
                        child: InkWell(
                          onTap: (){
                            ServiceCubit.get(context).ChangeChoosetwo();
                          },
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [
                              Text(ServiceCubit.get(context).s),
                              Icon(Icons.arrow_drop_up_outlined)
                            ],
                          ),
                        ),
                      ),
                      if(ServiceCubit.get(context).choosetwo)
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Container(
                            //color: Colors.grey,
                            height: 140,
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

                                        prefixIcon: Icon(
                                            Icons.add_location
                                        ),
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
                                        color: Colors.grey.shade200
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
                                                Language[index] ,style: TextStyle(fontSize: 20),
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
                    ],
                  ),
                ),

              )

          );
        },

      ),
    );
  }
}
