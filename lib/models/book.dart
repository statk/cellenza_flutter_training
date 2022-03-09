class Book{
  String isbn;
  String title;
  int price;
  String cover;
  List<String> synopsis;

  Book(this.isbn, this.title, this.price, this.cover, this.synopsis);

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      json['isbn'] as String,
      json['title'] as String,
      json['price'] as int,
      json['cover'] as String,
      List<String>.from(json['synopsis']),
    );
  }
}