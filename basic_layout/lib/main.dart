import 'package:flutter/material.dart';
import 'base_layout.dart';
import 'material_layout.dart';
import 'web_layout.dart';

void main() {
  runApp(const LayoutManager());
}

class LayoutManager extends StatelessWidget {
  const LayoutManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Weblayout();
  }
}
