import 'package:chrush/app/home/data/models/books_model.dart';

abstract class HomeCubitState {}

class Init extends HomeCubitState {}

class Succes extends HomeCubitState {
  final List<BooksModel> data ;

  Succes({required this.data}); 
}

class Error extends HomeCubitState {}
