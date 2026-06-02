import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';
import 'package:chrush/core/database/apiconsumer.dart';

class UserData {
  final Apiconsumer api;

  UserData({required this.api});
  addUser(UserEntitiey data) async {
    await api.addUser(data);
  }
  checkUser(UserSignIn data) async {
    await api.checkuser(data);
  }
}
