import 'package:chrush/app/home/data/models/books_model.dart';

abstract class HomeRepositiery {
  Future addbook(BooksModel data) ;
  Stream<List<BooksModel>> getbooks() ;
}
