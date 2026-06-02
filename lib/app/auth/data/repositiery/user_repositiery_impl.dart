import 'package:chrush/app/auth/data/data_sourse/user_data.dart';
import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';
import 'package:chrush/app/auth/domin/repositiry/user_repositiery.dart';

class UserRepositieryImpl implements UserRepositiery {
  final UserData userdata;

  UserRepositieryImpl({required this.userdata});
  @override
  Future adduser(UserEntitiey data) async {
    await userdata.api.addUser(data);
  }

  @override
  Future checkUser(UserSignIn data) async {
    await userdata.api.checkuser(data);
  }
}
