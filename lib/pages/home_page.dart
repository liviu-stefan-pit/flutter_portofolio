import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/books/books_provider.dart';
import 'search_page.dart';
import 'book_details_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _book;
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
      //display some error dialog or somethign
    }
  }

  Widget _showWeather() {
    final state = context.watch<BooksState>();

    if (state.status == BookStatus.initial) {
      return const Center(
        child: Text(
          'Search for a book',
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
          'Search for a book',
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: state.books.books.length,
      itemBuilder: (context, index) {
        final book = state.books.books[index];
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BookDetailsModal(book: book);
              },
            );
          },
          child: Card(
            child: Column(
              children: [
                Image.network(
                  book.thumbnail!,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    book.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    book.authors.join(', '),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              _book = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }),
              );
              if (_book != null) {
                context.read<BooksProvider>().fetchBooks(_book!);
              }
            },
          ),
        ],
      ),
      body: _showWeather(),
    );
  }
}
