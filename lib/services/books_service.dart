import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/book.dart';

abstract class AbstractBooksService{
  Future<List<Book>?> getBooks();
}

class BooksService implements AbstractBooksService{

  final String baseUrl = "https://henri-potier.techx.fr/books";

  @override
  Future<List<Book>?> getBooks() async{
    var client = Dio();
    var result = await client.get(baseUrl);
    if (result.statusCode == 200){
      List<Book> books = [];
      result.data.forEach((element) => books.add(Book.fromJson(element)));
      return books;
    }

    return null;
  }

}