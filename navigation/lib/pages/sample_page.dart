import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage(
      {super.key, required this.pageMessage, required this.pageColor});

  final String pageMessage;
  final Color pageColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pageColor,
      child: Center(child: Text(pageMessage)),
    );
  }
}
