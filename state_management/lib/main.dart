import 'package:flutter/material.dart';

import 'constants.dart';
import 'app_state.dart';
import 'server.dart';
import 'shopingcart_icon.dart';
import 'product_list.dart';

void main() {
  runApp(
    const AppStateWidget(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Store',
        home: MyStorePage(),
      ),
    ),
  );
}

class MyStorePage extends StatefulWidget {
  const MyStorePage({Key? key}) : super(key: key);

  @override
  MyStorePageState createState() => MyStorePageState();
}

class MyStorePageState extends State<MyStorePage> {
  bool _inSearch = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _toggleSearch(BuildContext context) {
    setState(() {
      _inSearch = !_inSearch;
    });
    AppStateWidget.of(context).setProductList(Server.getProductList());
    _controller.clear();
  }

  void _handleSearch(BuildContext context) {
    _focusNode.unfocus();
    final String filter = _controller.text;
    AppStateWidget.of(context)
        .setProductList(Server.getProductList(filter: filter));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network('$baseAssetURL/google-logo.png'),
            ),
            title: _inSearch
                ? TextField(
                    autofocus: true,
                    focusNode: _focusNode,
                    controller: _controller,
                    onSubmitted: (_) => _handleSearch(context),
                    decoration: InputDecoration(
                      hintText: 'Search Google Store',
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () => _handleSearch(context),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => _toggleSearch(context),
                      ),
                    ),
                  )
                : null,
            actions: [
              if (!_inSearch)
                IconButton(
                  onPressed: () => _toggleSearch(context),
                  icon: const Icon(Icons.search, color: Colors.black),
                ),
              const ShoppingCartIcon(),
            ],
            backgroundColor: Colors.white,
            pinned: true,
          ),
          const SliverToBoxAdapter(
            child: ProductListWidget(),
          ),
        ],
      ),
    );
  }
}



