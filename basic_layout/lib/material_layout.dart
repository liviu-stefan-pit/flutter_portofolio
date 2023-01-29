import 'package:flutter/material.dart';

class MaterialLayout extends StatelessWidget {
  const MaterialLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluuter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
