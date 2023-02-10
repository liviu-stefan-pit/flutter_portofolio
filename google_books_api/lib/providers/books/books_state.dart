part of 'books_provider.dart';

enum BookStatus {
  initial,
  loading,
  loaded,
  error,
}

class BooksState extends Equatable {
  final BookStatus status;
  final Books books;
  final CustomError error;

  const BooksState({
    required this.status,
    required this.books,
    required this.error,
  });

  factory BooksState.initial() => BooksState(
        status: BookStatus.initial,
        books: Books.initial(),
        error: const CustomError(),
      );

  BooksState copyWith({
    BookStatus? status,
    Books? books,
    CustomError? error,
  }) {
    return BooksState(
      status: status ?? this.status,
      books: books ?? this.books,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'BooksState(status: $status, books: $books, error: $error)';
  }

  @override
  List<Object?> get props => [status, books, error];
}
