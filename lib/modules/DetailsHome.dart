import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_system/BlocMap/cubit.dart';
import 'package:service_system/BlocMap/states.dart';
import 'package:service_system/Constant/Constant.dart';

class DetailsHome extends StatelessWidget {
  const DetailsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CubitMapCubit()..getLocation(),
      child: BlocConsumer<CubitMapCubit,MapStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=CubitMapCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    height: 100,

                    decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex:1,
                            child: IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back,size: 35,color: Colors.white)
                            ),
                          ),

                          Expanded(flex:2,child: Text('Visitor Information',style:TextStyle(fontSize: 20,color: Colors.white) ,)),

                          Expanded(child: Container(height:50,width:50,child: Image.asset('images/Icon/chat.png',))),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Country',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' Egypt',style: TextStyle(color: defaultColor),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('IP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text(' 192.168.10.1',style: TextStyle(color: defaultColor),)
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('City',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('Damnhour',style: TextStyle(color: defaultColor),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Redirected',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('www.google.com',style: TextStyle(color: defaultColor),)
                                  ],
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('3/14/2023',style: TextStyle(color: defaultColor),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Home Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('WWW.PageUrl.com',style: TextStyle(color: defaultColor),)
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Location',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('Damnhour',style: TextStyle(color: defaultColor),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Browser',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('www.google.com',style: TextStyle(color: defaultColor),)
                                  ],
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('Mohamed',style: TextStyle(color: defaultColor),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Mac Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('23.AA.ED.FF.EB',style: TextStyle(color: defaultColor),)
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('moh.morsy@gamil.com',style: TextStyle(color: defaultColor),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('0105463728',style: TextStyle(color: defaultColor),)
                                  ],
                                ),

                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Phone Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('Android 10',style: TextStyle(color: defaultColor),)
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Windows Type',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Text('Windows 10',style: TextStyle(color: defaultColor),)
                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:4 ,),
                  Text('GPS',style: TextStyle(fontSize:20 ,color: defaultColor,fontWeight: FontWeight.bold),),
                cubit.currentLocation!=null?
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(cubit.currentLocation!.latitude!, cubit.currentLocation!.longitude!),
                            zoom: 13.5
                        ),
                        markers: {
                          Marker(
                              markerId: MarkerId('current'),
                              position: LatLng(cubit.currentLocation!.latitude!, cubit.currentLocation!.longitude!),
                              infoWindow: InfoWindow(
                                  title: 'current location'
                              )
                          ),



                        },
                        onMapCreated: (mapController){
                          cubit.controller.complete(mapController);
                        },
                      ),
                    ),
                  ):Center(child: Text('Loading'))


                ],
              ),
            ),
          );
        },

      ),
    );
  }
}
