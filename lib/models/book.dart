import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String? id;
  final String? etag;
  final String? title;
  final List<String?> authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final int pageCount;
  final String? thumbnail;
  final String? language;
  final String? maturityRating;
  final double amount;
  final String? currencyCode;

  const Book({
    required this.id,
    required this.etag,
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.thumbnail,
    required this.language,
    required this.maturityRating,
    required this.amount,
    required this.currencyCode,
  });

  factory Book.initial() => const Book(
        id: '',
        etag: '',
        title: '',
        authors: [],
        publisher: '',
        publishedDate: '',
        description: '',
        pageCount: 0,
        thumbnail: '',
        language: '',
        maturityRating: '',
        amount: 0.0,
        currencyCode: '',
      );

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        etag: json['etag'],
        title: json['volumeInfo']['title'],
        authors: json['volumeInfo']['authors'] != null
            ? List<String>.from(json['volumeInfo']['authors'])
            : [],
        publisher: json['volumeInfo']['publisher'],
        publishedDate: json['volumeInfo']['publishedDate'],
        description: json['volumeInfo']['description'],
        pageCount: json['volumeInfo']['pageCount'],
        thumbnail: json['volumeInfo']['imageLinks']['thumbnail'],
        language: json['volumeInfo']['language'],
        maturityRating: json['volumeInfo']['maturityRating'],
        amount: json['saleInfo']['listPrice']['amount'],
        currencyCode: json['saleInfo']['listPrice']['currencyCode'],
      );

  @override
  List<Object?> get props => [
        id,
        etag,
        title,
        authors,
        publisher,
        publishedDate,
        description,
        pageCount,
        thumbnail,
        language,
        maturityRating,
        amount,
        currencyCode,
      ];

  @override
  String toString() {
    return 'Book{id: $id, etag: $etag, title: $title, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, pageCount: $pageCount, thumbnail: $thumbnail, language: $language, maturityRating: $maturityRating, amount: $amount, currencyCode: $currencyCode}';
  }

  Book copyWith({
    String? id,
    String? etag,
    String? title,
    List<String>? authors,
    String? publisher,
    String? publishedDate,
    String? description,
    int? pageCount,
    String? thumbnail,
    String? language,
    String? maturityRating,
    double? amount,
    String? currencyCode,
  }) {
    return Book(
      id: id ?? this.id,
      etag: etag ?? this.etag,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      description: description ?? this.description,
      pageCount: pageCount ?? this.pageCount,
      thumbnail: thumbnail ?? this.thumbnail,
      language: language ?? this.language,
      maturityRating: maturityRating ?? this.maturityRating,
      amount: amount ?? this.amount,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }
}
