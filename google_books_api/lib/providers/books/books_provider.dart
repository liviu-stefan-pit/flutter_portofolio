import 'package:equatable/equatable.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../models/books.dart';
import '../../models/custom_error.dart';
import '../../repositories/book_repository.dart';

part 'books_state.dart';

class BooksProvider extends StateNotifier<BooksState> with LocatorMixin {
  BooksProvider() : super(BooksState.initial());

  Future<void> fetchBooks(String query) async {
    state = state.copyWith(status: BookStatus.loading);

    try {
      final Books books = await read<BookRepository>().fetchBooks(query);

      state = state.copyWith(
        status: BookStatus.loaded,
        books: books,
      );
      print(books);
    } on CustomError catch (e) {
      state = state.copyWith(
        status: BookStatus.error,
        error: e,
      );
    }
  }
}
