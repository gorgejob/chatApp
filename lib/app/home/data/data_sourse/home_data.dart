import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:chrush/core/database/apiconsumer.dart';

class HomeData {
  final Apiconsumer api;

  HomeData({required this.api});

  addbook(BooksModel data)async{
    await api.addBook(data) ; 
  }
  
  Stream<List<BooksModel>> getbooks(){
    return  api.getBooks() ; 
  }
  


}
