import 'package:flutter/material.dart';

import '../components/rotating_container.dart';

class TransformSlidersPage extends StatefulWidget {
  TransformSlidersPage(
      {super.key,
      required this.onChanged,
      this.rotationX = 0.0,
      this.rotationY = 0.0,
      this.rotationZ = 0.0});

  double rotationX = 0.0;
  double rotationY = 0.0;
  double rotationZ = 0.0;
  final Function(double, double, double) onChanged;

  @override
  State<TransformSlidersPage> createState() => _TransformSlidersPageState();
}

class _TransformSlidersPageState extends State<TransformSlidersPage> {
  double rotationX = 0.0;
  double rotationY = 0.0;
  double rotationZ = 0.0;

  @override
  void initState() {
    rotationX = widget.rotationX;
    rotationY = widget.rotationY;
    rotationZ = widget.rotationZ;
    super.initState();
  }

  void _handleOnSliderDrag() {
    widget.onChanged(rotationX, rotationY, rotationZ);
  }

  Padding _buildSlider(double rotation, String axis) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('$axis: '),
          Expanded(
            child: Slider(
              value: rotation,
              min: 0.0,
              max: 360.0,
              onChanged: (double newValue) {
                setState(() {
                  if (axis == 'X') {
                    rotationX = newValue;
                  } else if (axis == 'Y') {
                    rotationY = newValue;
                  } else {
                    rotationZ = newValue;
                  }
                });

                _handleOnSliderDrag();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.blue,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              _buildSlider(rotationX, 'X'),
              _buildSlider(rotationY, 'Y'),
              _buildSlider(rotationZ, 'Z'),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: RotContainer(
                      color: Colors.purple,
                      containerSize: const Size(200, 200),
                      degreesOnX: rotationX,
                      degreesOnY: rotationY,
                      degreesOnZ: rotationZ,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
