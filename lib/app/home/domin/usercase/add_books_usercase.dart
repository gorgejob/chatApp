import 'package:chrush/app/home/data/models/books_model.dart';
import 'package:chrush/app/home/data/repositiery/home_repositiery_impl.dart';

class AddBooksUsercase {
  HomeRepositieryImpl homeRepositieryImpl;
  AddBooksUsercase({required this.homeRepositieryImpl});
  call(BooksModel data) async {
    await homeRepositieryImpl.addbook(data); 
  }
  Stream<List<BooksModel>> calltoget(){
    return  homeRepositieryImpl.getbooks(); 
  }
}
