import 'package:chrush/app/auth/data/data_sourse/user_data.dart';
import 'package:chrush/app/auth/data/repositiery/user_repositiery_impl.dart';
import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';
import 'package:chrush/app/auth/domin/usercase/add_user.dart';
import 'package:chrush/app/auth/presentition/cubit/cubit_state.dart';
import 'package:chrush/app/auth/presentition/screens/gorge.dart';
import 'package:chrush/core/database/dioconsumer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<CubitState> {
  AuthCubit() : super(init());

  navigatortopage(BuildContext context, Widget widget) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  adduser(UserEntitiey data) async {
    AddUserUsercase(
      userRepositiery: UserRepositieryImpl(
        userdata: UserData(api: DioConsummer(dio: Dio())),
      ),
    ).call(data);
  }

  checkuser(UserSignIn data, BuildContext context) async {
    AddUserUsercase(
      userRepositiery: UserRepositieryImpl(
        userdata: UserData(api: DioConsummer(dio: Dio())),
      ),
    ).callcheckuser(data);
    navigatortopage(context, gorge());
  }
}
