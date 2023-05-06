import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Bloc/Cubit.dart';

List<String> Language=[
  'arabic',
  'english',
  'francia',
  'espany',
  'japan',
  'lamdon',
  'cairo'
];
void ShowToast(
    {
      required String text,
      required ToastState state
    }
    )
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: ChooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastState{Success,Error,Warning}
Color? ChooseColor(ToastState state) {
  Color? color;
  switch (state) {
    case ToastState.Success:
      color = Colors.orange;
      break;
    case ToastState.Error:
      color = Colors.red;
      break;
    case ToastState.Warning:
      color = Colors.yellow;
  }
}
Widget n(context){
  return Container(
    //    height:ServiceCubit.get(context).choosetwo?200:50 ,
    child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            height: 60,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(ServiceCubit.get(context).s),
                    Icon(Icons.arrow_drop_up_outlined)
                  ],
                ),
              ),
            ),
          ),
        ),
        if(ServiceCubit.get(context).choosetwo)
          Container(
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
  );

}
Color border=Colors.grey;
Color defaultColor=HexColor('#FF31FA');