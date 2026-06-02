import 'dart:async';
import 'dart:developer';

import 'package:chrush/app/home/data/data_sourse/home_data.dart';
import 'package:chrush/app/home/data/data_sourse/local_home_data.dart';
import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:chrush/app/home/data/repositiery/home_repositiery_impl.dart';
import 'package:chrush/app/home/domin/usercase/add_books_usercase.dart';
import 'package:chrush/app/home/presentition/cubit/cubit_state.dart';
import 'package:chrush/core/database/check_internet.dart';
import 'package:chrush/core/database/dioconsumer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(Init());

  StreamSubscription? _booksSubscription;

  // إنشاء الـ instances (يفضل حقنها عبر الـ Constructor لاحقاً)
  final LocalHomeData _localHomeData = LocalHomeData();
  navigatortopage(BuildContext context, Widget widget) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  addbook(BooksModel data) async {
    AddBooksUsercase(
      homeRepositieryImpl: HomeRepositieryImpl(
        localHomeData: LocalHomeData(),
        homedata: HomeData(api: DioConsummer(dio: Dio())),
      ),
    ).call(data);
  }

  void getbooks() async {
    final network =
        await NetworkInfoImpl(
          internetConnection: InternetConnection(),
        ).isConnected;

    if (network == true) {
      // إلغاء أي اشتراك قديم
      _booksSubscription?.cancel();

      // فتح الـ Stream والـ الاستماع للتغييرات Real-time
      final streamData =
          AddBooksUsercase(
            homeRepositieryImpl: HomeRepositieryImpl(
              localHomeData: _localHomeData,
              homedata: HomeData(api: DioConsummer(dio: Dio())),
            ),
          ).calltoget();

      _booksSubscription = streamData.listen(
        (event) {
          emit(Succes(data: event));
        },
        onError: (error) {
          _loadOfflineData();
        },
      );
    } else {
      // لو أوفلاين من البداية
      _loadOfflineData();
    }
  }

  // دالة مساعدة لجلب الكاش
  void _loadOfflineData() async {
    try {
      final localData = await _localHomeData.getdata();
      emit(Succes(data: localData));
    } catch (e) {
      log("error: $e");
    }
  }

  @override
  Future<void> close() {
    _booksSubscription?.cancel(); // قفل الـ Stream عشان الـ Memory Leaks
    return super.close();
  }
}
