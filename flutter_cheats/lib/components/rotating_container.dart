import 'package:flutter/material.dart';
import 'dart:math';

class RotContainer extends StatelessWidget {
  RotContainer(
      {super.key,
      this.containerSize = const Size(100, 100),
      this.color = Colors.blue,
      this.degreesOnX = 0.0,
      this.degreesOnY = 0.0,
      this.degreesOnZ = 0.0});

  Size containerSize;
  Color color;
  double degreesOnX;
  double degreesOnY;
  double degreesOnZ;

  double getRadians(double degrees) {
    return degrees * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationX(getRadians(degreesOnX))
        ..rotateY(getRadians(degreesOnY))
        ..rotateZ(getRadians(degreesOnZ)),
      origin: Offset(containerSize.width / 2, containerSize.height / 2),
      child: Container(
        height: containerSize.height,
        width: containerSize.width,
        color: color,
      ),
    );
  }
}
