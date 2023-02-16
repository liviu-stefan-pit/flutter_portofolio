import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import './repositories/book_repository.dart';
import './services/book_api_services.dart';

import './providers/books/books_provider.dart';
import './pages/home_page.dart';
import './repositories/book_repository.dart';
import './services/book_api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BookRepository>(
          create: (context) => BookRepository(
            bookApiServices: BookApiServices(
              httpClient: http.Client(),
            ),
          ),
        ),
        StateNotifierProvider<BooksProvider, BooksState>(
          create: (context) => BooksProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
