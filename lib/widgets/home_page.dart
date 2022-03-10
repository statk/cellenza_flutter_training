import 'package:cellenza_flutter_onboarding/cubits/books_cubit.dart';
import 'package:cellenza_flutter_onboarding/models/book.dart';
import 'package:cellenza_flutter_onboarding/states/base_state.dart';
import 'package:cellenza_flutter_onboarding/states/books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_preview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BookCubit>(context).getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<BookCubit, BaseState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PendingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BooksResult) {
            return BooksList(state);
          }
          else {
              return const Center(
                child: Text('Error'),
              );
            }
        },
      ),
    );
  }
}

class BooksList extends StatelessWidget {
  final BooksResult _state;

  const BooksList(this._state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 100),
      itemBuilder: (_, i) {
        final item = _state.books[i];
        return GestureDetector(
          onTap: () => _onItemSelected(item, context),
          child: Card(
            child: Center(
              child: Row(
                children: [
                  Image.network(
                    item.cover,
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
                        child: Text(item.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          item.synopsis.join(),
                          maxLines: 6,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: _state.books.length,
    );
  }

  void _onItemSelected(Book item, BuildContext context) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => BookPreview(item)));
  }
}

