import 'package:chrush/app/auth/data/repositiery/user_repositiery_impl.dart';
import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';

class AddUserUsercase {
  final UserRepositieryImpl userRepositiery;

  AddUserUsercase({required this.userRepositiery});
  call(UserEntitiey data) async {
    await userRepositiery.adduser(data);
  }

  callcheckuser(UserSignIn data) async {
    await userRepositiery.checkUser(data);
  }
}
