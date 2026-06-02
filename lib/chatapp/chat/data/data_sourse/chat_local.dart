import 'dart:convert';

import 'package:chrush/chatapp/chat/data/model/user_model.dart';
import 'package:chrush/core/shared/shared_prefernce.dart';

class ChatLocal {
  final SharedPrefernce sharedPrefernce = SharedPrefernce();

  saveUser(UserModel user) async {
    final data = jsonEncode(user.toJson());
    sharedPrefernce.set("User_data", data);
  }

  Future<UserModel> getUser() async {
    final save = sharedPrefernce.get("User_data");
    final Map<String, dynamic> json = jsonDecode(save);
    return UserModel.fromjson(json);
  }
}
