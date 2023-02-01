import 'package:flutter/material.dart';
import 'package:flutter_cheats/pages/transform_sliders.dart';

import 'components/rotating_container.dart';
import 'constants.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveGridView(),
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderThemeData(
          inactiveTrackColor: kInactiveColor,
          activeTrackColor: kActiveTrackColor,
          thumbColor: kSecondaryColor,
          overlayColor: kOverlayColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
      ),
    );
  }
}

class ResponsiveGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.count(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5),
          children: List.generate(
            10,
            (index) => TransformSlidersCard(),
          ),
        ),
      ),
    );
  }
}
