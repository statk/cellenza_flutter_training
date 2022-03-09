import 'package:cellenza_flutter_onboarding/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/books_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<BookCubit>(create: (context) => BookCubit())
      ],
      child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}
