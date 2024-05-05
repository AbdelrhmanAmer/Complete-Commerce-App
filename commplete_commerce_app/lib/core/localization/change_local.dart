import 'package:commplete_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{
  Locale? intialLanguage;
  MyServices myServices = Get.find();

  changeLang(String langCode){
    Locale locale = Locale(langCode);
    
    myServices.sharedPreferences.setString("lang", langCode);
    
    Get.updateLocale(locale);
  }
  
  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");

    if(sharedPrefLang == "ar"){
      intialLanguage = const Locale("ar");
    }else if(sharedPrefLang == "en"){
      intialLanguage = const Locale("en");
    }else{
      intialLanguage = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }

} 