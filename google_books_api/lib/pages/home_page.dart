import 'package:flutter/material.dart';
import 'package:google_books_api/models/book.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../providers/books/books_provider.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  late final BooksProvider _weatherProv;
  late final void Function() _removeListener;

  @override
  void initState() {
    super.initState();
    _weatherProv = context.read<BooksProvider>();
    _removeListener = _weatherProv.addListener(_registerListener);
  }

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  void _registerListener(BooksState ws) {
    if (ws.status == BookStatus.error) {
      //display some errro message
    }
  }

  Widget _showWeather() {
    final state = context.watch<BooksState>();

    if (state.status == BookStatus.initial) {
      return const Center(
        child: Text(
          'Select a city',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }

    if (state.status == BookStatus.loading) {
      if (state.status == BookStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }

    if (state.status == BookStatus.error && state.books.books.isEmpty) {
      return const Center(
        child: Text(
          'Select a city',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }

    return ListView.builder(
      itemCount: state.books.books.length,
      itemBuilder: (context, index) {
        final book = state.books.books[index];
        return Text(
          book.title!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              context.read<BooksProvider>().fetchBooks('9786067891737');
            },
          ),
        ],
      ),
      body: _showWeather(),
    );
  }
}
