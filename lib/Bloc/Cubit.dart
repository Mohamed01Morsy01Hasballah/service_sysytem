import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_system/Bloc/States.dart';
import 'package:service_system/modules/HomeScreen.dart';
import 'package:service_system/modules/SettingScreen.dart';

import '../models/AddonsModel.dart';
import '../models/PaymentWay.dart';
import '../models/PaymentWayKind.dart';
import '../models/ShoppingItemModel.dart';
import '../modules/Setting/setting.dart';
import '../modules/payment/payment_way_screen.dart';

class ServiceCubit extends Cubit<ServiceStates>{
  ServiceCubit():super(initialState());
  static ServiceCubit get(context)=>BlocProvider.of(context);
  List<String> messages=[];
  void SendMessage(var text){
    messages.add(text);
    emit(SendMessageState());
  }


  var currentIndex=0;
  var ChooseInputOne;
  void ChangeInputOne(value){
    ChooseInputOne=value;
    emit(ChangeChooseState());
  }
  var ChooseInputTwo;
  void ChangeInputTwo(value){
    ChooseInputTwo=value;
    emit(ChangeChooseState());
  }
  var ChooseInputThree;
  void ChangeInputThree(value){
    ChooseInputThree=value;
    emit(ChangeChooseState());
  }
  bool SearchResult=false;
  void SearchRes(){
    SearchResult=!SearchResult;
    emit(SearchResultState());
  }
  void initialSearch(){
    SearchResult=false;
    emit(InitialSearchResultState());
  }
  bool dropdown=false;
  bool choose=false;
  String select='Select Please';
  void ChangeSelect(value){
    select=value;
    //ChangeDropDown();
    emit(changeSelectState());
  }
  void ChangeDropDown(){
    dropdown=!dropdown;
    emit(changeDropDownState());
  }
  void ChangeChoose(){
    choose=!choose;
    emit(changeChooseState());
  }
  bool choosetwo=false;
  void ChangeChoosetwo(){
    choosetwo=!choosetwo;
    emit(changeChooseState());
  }
  void onStepIncrease(){
    currentIndex+=1;
    emit(StepIncreaseState());

  }

  void onStepDecrease(){
   currentIndex-=1;
   emit(StepDecreaseState());

  }
  String? itemOne;
 // String? itemTwo;
  void changeItemone(value){
    itemOne=value;
    emit(changeItemOneState());
  }
  void changeSettper(step){
    currentIndex=step;
    emit(changeStepperState());
  }
  List<String> listItemEmpty=[];
 void changeAddListItem(value){
   listItemEmpty.add(value);
   emit(changeAddListItemState());
 }
 FocusNode? focusNode;
 void changeFocusNode(){
   focusNode=FocusNode();
   focusNode!.addListener(() {
     emit(changeFocusNodeState());
   });
   emit(changeFocusNodeState());

 }
 var s='Enter County';
 var SelectCountry=TextEditingController();
 void changeSelectCountry(value){
   SelectCountry.text=value;
   s=value;
   ChangeChoose();
   ChangeChoosetwo();
   emit(changeSelectSelectState());
 }
  void ShowMessage(){
    emit(ShowMessageState());
  }
  var Index=0;
 void ChangeBottomChange(value){
   currentIndex=value;
   emit(ChangeBottomChangeState());
 }
 List<Widget>Screen=[
   HomeScreen(),
   HomeScreen(),
   HomeScreen(),
   setting()
 ];
 bool Setting =false;
 void ChangeSetting(){
   Setting=!Setting;
   emit(ChangeSettingState());
 }
  bool SettingOne =false;
  void ChangeSettingOne(){
    SettingOne=!SettingOne;
    emit(ChangeSettingState());
  }
  bool SettingTwo =false;
  void ChangeSettingTwo(){
    SettingTwo=!SettingTwo;
    emit(ChangeSettingState());
  }
  bool SettingThree =false;
  void ChangeSettingThree(){
    SettingThree=!SettingThree;
    emit(ChangeSettingState());
  }
  bool Switch=false;
  void ChangeMode(value){
    Switch=value;
    emit(ChangeModeState());
  }
  bool language=false;
  void ChangeLanguage(value){
    language=value;
    emit(ChangeLanguageState());
  }
  bool addOne=false;
  bool addTwo=false;
  bool addThree=false;
  bool addFour=false;
  bool addFive=false;
  bool addSix=false;

  void AddProduct(value){
    if(value==1){
      addOne=!addOne;

    }
    if(value==2){
      addTwo=!addTwo;

    }
    if(value==3){
      addThree=!addThree;

    }
    if(value==4){
      addFour=!addFour;

    }
    if(value==5){
      addFive=!addFive;

    }
    if(value==6){
      addSix=!addSix;

    }

    emit(AddProductState());
  }

  List<ShoppingItemModel> list = [
    ShoppingItemModel("www.test.net", 10),
    ShoppingItemModel("www.test.edu", 10),
    ShoppingItemModel("www.test.org", 10),
    ShoppingItemModel("www.test.net", 10),
    ShoppingItemModel("www.test.edu", 10),
    ShoppingItemModel("www.test.org", 10),
    ShoppingItemModel("www.test.net", 10),
    ShoppingItemModel("www.test.edu", 10),
    ShoppingItemModel("www.test.org", 10),
  ];

  List<bool>? isCheckedShopping;
  void ChangeCheckedShopping(){
    isCheckedShopping = List<bool>.filled(list.length, false);
    emit(ChangeBottomChangeState());

  }
  void CheckBox(item,value){
    isCheckedShopping![list.indexOf(item)]=value;
   emit( CheckBoxState());
  }
  void Deleteitem(item){
    list.remove(item);
    emit( RemoveState());
  }
  List<bool>? isCheckedAddons;
  List<AddonsModel> Addonslist = [
    AddonsModel(
        "https://banner2.cleanpng.com/20201013/zkh/transparent-web-security-icon-secure-icon-shield-icon-5f852bc564f200.4320229216025630134135.jpg",
        " Keep Your Visitor Data safe-And Build Confidence in Your Website",
        "Our FREE SSL ensures that visitor data (credit cards, passwords, etc.) is secure and protected... but you can take it to the next level. Upgrade to Positive SSL by Sectigo and you'll be able to display your secured-site badge from the Global Leader in SSLs to further increase visitor confidence.",
        "\$3.33/mo",
        "\$4.5/mo",
        true),
    AddonsModel(
        "https://img.icons8.com/plasticine/452/computer-ram.png",
        "Keep Your Visitor Data safe-And Build Confidence in Your Website",
        "Our FREE SSL ensures that visitor data (credit cards, passwords, etc.) is secure and protected... but you can take it to the next level. Upgrade to Positive SSL by Sectigo and you'll be able to display your secured-site badge from the Global Leader in SSLs to further increase visitor confidence.",
        "\$3.33/mo",
        "",
        false),
    AddonsModel(
        "https://banner2.cleanpng.com/20201013/zkh/transparent-web-security-icon-secure-icon-shield-icon-5f852bc564f200.4320229216025630134135.jpg",
        "Keep Your Visitor Data safe-And Build Confidence in Your Website",
        "Our FREE SSL ensures that visitor data (credit cards, passwords, etc.) is secure and protected... but you can take it to the next level. Upgrade to Positive SSL by Sectigo and you'll be able to display your secured-site badge from the Global Leader in SSLs to further increase visitor confidence.",
        "\$3.33/mo",
        "\$4.5/mo",
        true),
    AddonsModel(
        "https://img.icons8.com/plasticine/452/computer-ram.png",
        "Keep Your Visitor Data safe-And Build Confidence in Your Website",
        "Our FREE SSL ensures that visitor data (credit cards, passwords, etc.) is secure and protected... but you can take it to the next level. Upgrade to Positive SSL by Sectigo and you'll be able to display your secured-site badge from the Global Leader in SSLs to further increase visitor confidence.",
        "\$3.33/mo",
        "",
        false),
  ];
  void ChangeCheckedAddons(){
    isCheckedAddons = List<bool>.filled(Addonslist.length, false);
    emit(ChangeBottomChangeState());

  }
  void CheckBoxAddons(item,value){
    isCheckedAddons![Addonslist.indexOf(item)]=value;
    emit( CheckBoxState());
  }
  int valuePayment=0;
  List<PaymentWay> paymentWays = [
    PaymentWay("Card", "https://image.flaticon.com/icons/png/512/44/44758.png"),
    PaymentWay("Fawry",
        "https://pwstg02.blob.core.windows.net/pwfiles/ContentFiles/8468Image.jpg"),
    PaymentWay(
        "payPal", "https://image.flaticon.com/icons/png/512/1145/1145485.png"),
    PaymentWay(
        "payoneer", "https://image.flaticon.com/icons/png/512/38/38996.png"),
  ];

int? valueKind;
void IntialValueKind(){
  valueKind=0;
  emit(InitialSearchResultState());
}
  List<PaymentWayKind> paymentWaysKind = [
    PaymentWayKind("Cash",
        "https://tse4.mm.bing.net/th?id=OIP.nQVgWDObnUTpMSIBxss2hQHaHa&pid=Api&P=0",PaymentWayScreen()),
    PaymentWayKind("Card", "https://tse4.mm.bing.net/th?id=OIP.nQVgWDObnUTpMSIBxss2hQHaHa&pid=Api&P=0", PaymentWayScreen()),
  ];
}
//https://tse4.mm.bing.net/th?id=OIP.nQVgWDObnUTpMSIBxss2hQHaHa&pid=Api&P=0
