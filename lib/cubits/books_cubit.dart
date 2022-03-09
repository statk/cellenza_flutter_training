import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/books_service.dart';
import '../states/base_state.dart';
import '../states/books_state.dart';

class BookCubit extends Cubit<BaseState> {

  final AbstractBooksService _booksService = BooksService();

  BookCubit() : super(InitialState());

  Future getBooks() async{
    emit(PendingState());
    var books = await _booksService.getBooks();
    if (books != null) {
      emit(BooksResult(books));
    }
  }
}