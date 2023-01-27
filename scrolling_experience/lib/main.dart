import 'package:flutter/material.dart';

import 'weekly_forecast.dart';
import 'constant_scroll.dart';

void main() {
  runApp(const HorizonsApp());
}

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // This is the theme of your application.
      theme: ThemeData.dark(),
      // Scrolling in Flutter behaves differently depending on the
      // ScrollBehavior. By default, ScrollBehavior changes depending
      // on the current platform. For the purposes of this scrolling
      // workshop, we're using a custom ScrollBehavior so that the
      // experience is the same for everyone - regardless of the
      // platform they are using.
      scrollBehavior: const ConstantScrollBehavior(),
      title: 'Horizons Weather',
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Horizons'),
        //   backgroundColor: Colors.teal[800],
        // ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              onStretchTrigger: () async {
                print('Load new data!');
                // await Server.requestNewData();
              },
              backgroundColor: Colors.teal[800],
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
                title: const Text('Horizons'),
                background: DecoratedBox(
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: <Color>[Colors.teal[800]!, Colors.transparent],
                    ),
                  ),
                  child: Image.network(
                    'https://media.istockphoto.com/id/1327276218/photo/the-picturesque-mountain-landscape-on-the-sunset-background.jpg?b=1&s=170667a&w=0&k=20&c=8tzAabsLYLhMW6iDoeuBZUuaozi-F0lL2KcE49JVVaI=',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const WeeklyForecastList(),
          ],
        ),
      ),
    );
  }
}