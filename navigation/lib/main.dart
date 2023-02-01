import 'package:flutter/material.dart';

import 'hero_widget.dart';
import 'pages/bottom_nav_bar.dart';
import 'complex_bottom_navbar.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo Navigation',
      home: Home(),
    );
  }
}
