import 'dart:convert';

import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernce {
  static late SharedPreferences shared;
  init() async {
    shared = await SharedPreferences.getInstance();
  }
  set(String key , String data)async{
    shared.setString(key,data ); 
  }
  get(String key){
    return shared.getString(key); 
  }

}
