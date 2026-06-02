import 'dart:developer';

import 'package:chrush/app/auth/data/data_sourse/user_data.dart';
import 'package:chrush/app/home/data/data_sourse/home_data.dart';
import 'package:chrush/app/home/data/data_sourse/local_home_data.dart';
import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:chrush/app/home/domin/repositiry/home_repositiery.dart';

class HomeRepositieryImpl implements HomeRepositiery {
  final HomeData homedata;
  final LocalHomeData localHomeData;

  HomeRepositieryImpl({required this.homedata, required this.localHomeData});

  @override
  Future addbook(BooksModel data) async {
    await homedata.addbook(data);
  }

  @override
  Stream<List<BooksModel>> getbooks() {
    // استخدام asyncMap بدلاً من map العادية للتعامل مع العمليات المستقبلية (Async)
    return homedata.getbooks().asyncMap((event) async {
      try {
        log("تم استقبال بيانات جديدة من السيرفر، جاري الحفظ في الكاش المحلي...");
        // الآن التطبيق سينتظر الحفظ بنجاح قبل تمرير البيانات
        await localHomeData.setdata(event); 
      } catch (e) {
        log("فشل حفظ البيانات في الكاش: $e");
      }
      
      return event; // إرجاع البيانات للـ Cubit بعد انتهاء الحفظ (أو حتى لو فشل الحفظ لكي لا تتعطل الشاشة)
    });
  }
}
