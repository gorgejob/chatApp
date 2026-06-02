import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';

abstract class UserRepositiery {
  Future adduser(UserEntitiey data);
  Future checkUser(UserSignIn data);
}
