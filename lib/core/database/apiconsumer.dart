import 'package:chrush/app/auth/domin/entitiy/user_entitiey.dart';
import 'package:chrush/app/auth/domin/entitiy/user_sign_in.dart';
import 'package:chrush/app/home/data/models/books_model.dart';

abstract class Apiconsumer {
  Future addUser(UserEntitiey data);
  Future checkuser(UserSignIn data);
  Stream<List<BooksModel>> getBooks();
  Future addBook(BooksModel data);
  Future editBook(id);
  Future deleteBook(id);
}
