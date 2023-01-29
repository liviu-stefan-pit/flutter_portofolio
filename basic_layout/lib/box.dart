import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  const BoxContainer({super.key, this.color = Colors.blue, this.width = 50, this.height = 50});

  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
      ),
    );
  }
}