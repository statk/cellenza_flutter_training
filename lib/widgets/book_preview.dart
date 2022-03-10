import 'package:cellenza_flutter_onboarding/models/book.dart';
import 'package:flutter/material.dart';

class BookPreview extends StatelessWidget {
  final Book book;

  const BookPreview(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body:  Center(
        child: Row(
          children: [
            Image.network(
              book.cover,
              height: 150,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(book.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    book.synopsis.join(),
                    maxLines: 6,
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
