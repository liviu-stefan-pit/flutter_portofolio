import '../exceptions/book_exception.dart';
import '../models/books.dart';
import '../services/book_api_services.dart';
import '../models/custom_error.dart';

class BookRepository {
  final BookApiServices bookApiServices;

  BookRepository({required this.bookApiServices});

  Future<Books> fetchBooks(String query) async {
    try {
      final Books tempBooks = await bookApiServices.getBooks(query);
      final Books books = tempBooks.copyWith(books: tempBooks.books);

      return books;
    } on BookException catch (e) {
      throw CustomError(message: e.message);
    } catch (e) {
      throw CustomError(message: e.toString());
    }
  }
}
