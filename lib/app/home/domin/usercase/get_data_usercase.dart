import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';
import 'package:chrush/app/home/data/repositiery/home_repositiery_impl.dart';

class GetDataUsercase {
  final HomeRepositieryImpl userRepositiery;

  GetDataUsercase({required this.userRepositiery});
  call(UserEntitiey data) async {
  }

  callcheckuser(UserSignIn data) async {
  }
}
