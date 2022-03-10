import 'package:cellenza_flutter_onboarding/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'cubits/books_cubit.dart';
import 'services/books_service.dart';

final getIt = GetIt.instance;
void main() async{
  getIt.registerSingleton<AbstractBooksService>(BooksService());
  getIt.registerFactory<BookCubit>(() => BookCubit(getIt.get<AbstractBooksService>()));

  await getIt.allReady();
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
        BlocProvider<BookCubit>(create: (context) => getIt.get<BookCubit>())
      ],
      child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}
