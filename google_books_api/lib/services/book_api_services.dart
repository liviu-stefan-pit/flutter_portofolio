import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/book.dart';
import '../models/books.dart';
import '../constants/constants.dart';
import '../exceptions/book_exception.dart';
import 'http_error_handler.dart';

class BookApiServices {
  final http.Client httpClient;

  BookApiServices({required this.httpClient});

  Future<Books> getBooks(String query) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kApiHost,
      path: '/books/v1/volumes',
      queryParameters: {
        'q': query,
      },
    );

    List<Book> books = [];

    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }

      final b = response.body;
      print(b);
      final booksJson = jsonDecode(response.body);
      final Books books = Books.fromJson(booksJson['items']);

      return books;
    } catch (e) {
      rethrow;
    }
  }
}
