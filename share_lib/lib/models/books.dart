import 'dart:io';

import 'package:equatable/equatable.dart';

import 'book.dart';

class Books extends Equatable {
  final List<Book> books;

  const Books({required this.books});

  factory Books.initial() => const Books(books: []);

  Books copyWith({List<Book>? books}) {
    return Books(
      books: books ?? this.books,
    );
  }

  factory Books.fromJson(List<dynamic> json) {
    List<Book> books = [];

    for (var i = 0; i < json.length; i++) {
      try {
        var book = Book.fromJson(json[i]);
        books.add(book);
      } catch (e) {
        print(e);
      }
    }

    return Books(books: books);
  }

  @override
  List<Object?> get props => [books];

  @override
  bool get stringify => true;
}
