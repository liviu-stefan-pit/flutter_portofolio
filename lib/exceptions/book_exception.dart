class BookException implements Exception {
  String message;

  BookException([this.message = 'Something went wrong.']) {
    message = 'Exception: $message ';
  }

  @override
  String toString() {
    return message;
  }
}
