import 'package:cellenza_flutter_onboarding/cubits/books_cubit.dart';
import 'package:cellenza_flutter_onboarding/models/book.dart';
import 'package:cellenza_flutter_onboarding/services/books_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'book_cubit_tests.mocks.dart';

@GenerateMocks([AbstractBooksService])
main(){
  test('book cubit should get books',() async{
     // Arrange.
    var service = MockAbstractBooksService();
    var executed = false;
    List<Book> list = [];
    when(service.getBooks()).thenAnswer((realInvocation) async{
      executed = true;
      return list;
    });
    var sut = BookCubit(service);

    // Act.
    await sut.getBooks();

    // Assert.
    expect(executed, true);
  });
}