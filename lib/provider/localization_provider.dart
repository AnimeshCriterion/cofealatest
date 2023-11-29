import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider extends ChangeNotifier {
  final SharedPreferences? sharedPreferences;
  final DioClient? dioClient;

  LocalizationProvider({required this.sharedPreferences, required this.dioClient}) {
    _loadCurrentLanguage();
  }




  Locale _locale = Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode);
  bool _isLtr = true;
  int? _languageIndex;
  bool? _isLanguageSystem = true;

Locale? systemLocal;



  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  int? get languageIndex => _languageIndex;
  bool? get languageSystemDefualt => _isLanguageSystem;

   getSystemDeviceLocale() async{
    var data=await Devicelocale.currentLocale;
    List systemList=data!.split("-").toList();
    systemLocal=Locale(systemList[0].toString(),systemList[1].toString());
    dioClient!.updateHeader(null, systemList[1]);
    print("Ainemmeee"+systemLocal.toString());
     notifyListeners();

  }

  void setLanguage(Locale locale) {
    _locale = locale;
    _isLtr = _locale!.languageCode != 'ar';
    dioClient!.updateHeader(null, locale.countryCode);
    for(int index=0; index<AppConstants.languages.length; index++) {
      if(AppConstants.languages[index].languageCode == locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    _saveLanguage(_locale);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale = Locale(sharedPreferences!.getString(AppConstants.languageCode) ?? AppConstants.languages[0].languageCode!,
        sharedPreferences!.getString(AppConstants.countryCode) ?? AppConstants.languages[0].countryCode);
    _isLtr = _locale.languageCode != 'ar';
    for(int index=0; index<AppConstants.languages.length; index++) {
      if(AppConstants.languages[index].languageCode == locale.languageCode) {
        _languageIndex = index;
        break;
      }
    }
    notifyListeners();
  }

  _saveLanguage(Locale locale) async {
    sharedPreferences!.setString(AppConstants.languageCode, locale.languageCode);
    sharedPreferences!.setString(AppConstants.countryCode, locale.countryCode!);
  }


  void setLangaugeSystemDefault(bool isSystem){
    sharedPreferences!.setBool("isSystemDefualt",isSystem)??false;

  }

  bool? getLanguageSystemDefualt(){
     if(sharedPreferences!.getBool("isSystemDefualt")!=null){
     _isLanguageSystem=sharedPreferences!.getBool("isSystemDefualt");
     }else{
       _isLanguageSystem=true;
     }

     return _isLanguageSystem;
  }


}