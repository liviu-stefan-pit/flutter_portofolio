import 'package:flutter/material.dart';

import 'constants.dart';

class Weblayout extends StatelessWidget {
  const Weblayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: Colors.lightBlue,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Rip Pavlova'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                      color: Colors.lightBlue,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(kLoremIpsum),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.lightBlue,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('4 Stars'),
                              Text('234 Reviews'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.lightBlue,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(Icons.food_bank),
                                  Text('Sample text'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Sample Text'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.food_bank),
                                  Text('Sample text'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Sample Text'),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(Icons.food_bank),
                                  Text('Sample text'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Sample Text'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.network(
                fit: BoxFit.fill,
                  'https://hips.hearstapps.com/hmg-prod/images/delish-halloween-cake-horizontal-1539895591.jpg?crop=0.8888888888888888xw:1xh;center,top&resize=1200:*'),
            ),
          ],
        ),
      ),
    );
  }
}
