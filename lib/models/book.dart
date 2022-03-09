import 'package:flutter/cupertino.dart';

class Book{
  String isbn;
  String title;
  int price;
  String cover;
  List<String> synopsis;

  Book(this.isbn, this.title, this.price, this.cover, this.synopsis);
}