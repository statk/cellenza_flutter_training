import '../models/book.dart';
import 'base_state.dart';

class BooksResult extends SuccessState{
  List<Book> books;
  BooksResult(this.books);
}