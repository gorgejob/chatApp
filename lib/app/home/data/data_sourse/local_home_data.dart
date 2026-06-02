import 'dart:convert';
import 'dart:developer';

import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:chrush/core/shared/shared_prefernce.dart';

class LocalHomeData {
  final SharedPrefernce shared = SharedPrefernce();

  setdata(List<BooksModel> data) {
    try {
      log("يتم الحفظ");
      final List<Map<String, dynamic>> maps =
          data.map((e) => e.tojson()).toList();
      final String datar = jsonEncode(maps);
      shared.set("Books", datar);
      log("تم الحفظ");
    } on Exception catch (e) {
      log(e.toString());
      // TODO
    }
  }

  Future<List<BooksModel>> getdata() async {
    try {
      log("يتم جلب البيانات من الكاش...");

      final rawData = shared.get("Books");

      if (rawData == null) {
        log("لا توجد بيانات محفوظة مسبقاً.");
        return [];
      }

      // الحل هنا: استقبلها كـ List<dynamic> أولاً لأن jsonDecode تعيد هذا النوع دائماً
      final List<dynamic> decodedList = jsonDecode(rawData);

      // عند عمل الكاستينج (map)، نقوم بتحويل كل عنصر داخل القائمة إلى Map بشكل صريح
      final List<BooksModel> books =
          decodedList.map((item) {
            return BooksModel.fromjson(item as Map<String, dynamic>);
          }).toList();

      log("تم جلب ${books.length} كتب بنجاح!");
      return books;
    } catch (e) {
      log("حدث خطأ داخل getdata: ${e.toString()}");
      return [];
    }
  }
}
