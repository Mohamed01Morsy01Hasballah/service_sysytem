import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:service_system/BlocMap/states.dart';



class CubitMapCubit extends Cubit<MapStates>{
  CubitMapCubit():super(initialMapState());
  static CubitMapCubit get(context) =>BlocProvider.of(context);
  //static const LatLng source=LatLng(30.671538711922896, 30.05703672859341);
 // static const LatLng distination=LatLng(30.672138508917943, 30.072849159999556);
  LocationData? currentLocation;
  final Completer<GoogleMapController> controller=Completer();

  void getLocation()async{
    Location location=Location();
    location.getLocation().then((value) {
      currentLocation=value;
      emit(GetLocationState());
    });
    GoogleMapController googleMapController=await controller.future;

    location.onLocationChanged.listen((event) {

        currentLocation=event;
        emit(GetLocationState());


        googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 13.5,
          target: LatLng(
              event.latitude!,
              event.longitude!
          )
      )
      ));
        emit(GetLocationState());


    });

  }



}

