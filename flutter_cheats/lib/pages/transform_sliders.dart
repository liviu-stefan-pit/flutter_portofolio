import 'package:flutter/material.dart';

import '../components/rotating_container.dart';
import 'transform_sliders_page.dart';

class TransformSlidersCard extends StatefulWidget {
  const TransformSlidersCard({super.key});

  @override
  State<TransformSlidersCard> createState() => _TransformSlidersCardState();
}

class _TransformSlidersCardState extends State<TransformSlidersCard> {
  double _rotationX = 0.0;
  double _rotationY = 0.0;
  double _rotationZ = 0.0;

  void handleContainerState(double rx, double ry, double rz) {
    setState(() {
      _rotationX = rx;
      _rotationY = ry;
      _rotationZ = rz;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransformSlidersPage(
                onChanged: handleContainerState,
                rotationX: _rotationX,
                rotationY: _rotationY,
                rotationZ: _rotationZ,
              ),
            )),
      },
      child: Card(
          elevation: 4,
          child: Stack(
            children: <Widget>[
              Center(
                child: RotContainer(
                  degreesOnX: _rotationX,
                  degreesOnY: _rotationY,
                  degreesOnZ: _rotationZ,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("3D rotation using sliders",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          )),
    );
  }
}
