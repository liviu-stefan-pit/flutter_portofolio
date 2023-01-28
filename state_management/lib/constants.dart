import 'package:flutter/material.dart';

import 'product.dart';

const String baseAssetURL =
    'https://dartpad-workshops-io2021.web.app/inherited_widget/assets';

const Map<String, Product> kDummyData = {
  '0': Product(
    id: '0',
    title: 'Explore Pixel phones',
    description: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'Capture the details.\n',
        style: TextStyle(color: Colors.black),
      ),
      TextSpan(
        text: 'Capture your world.',
        style: TextStyle(color: Colors.blue),
      ),
    ]),
    pictureURL: '$baseAssetURL/pixels.png',
  ),
  '1': Product(
    id: '1',
    title: 'Nest Audio',
    description: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Amazing sound.\n', style: TextStyle(color: Colors.green)),
      TextSpan(text: 'At your command.', style: TextStyle(color: Colors.black)),
    ]),
    pictureURL: '$baseAssetURL/nest.png',
  ),
  '2': Product(
    id: '2',
    title: 'Nest Audio Entertainment packages',
    description: TextSpan(children: <TextSpan>[
      TextSpan(
        text: 'Built for music.\n',
        style: TextStyle(color: Colors.orange),
      ),
      TextSpan(
        text: 'Made for you.',
        style: TextStyle(color: Colors.black),
      ),
    ]),
    pictureURL: '$baseAssetURL/nest-audio-packages.png',
  ),
  '3': Product(
    id: '3',
    title: 'Nest Home Security packages',
    description: TextSpan(children: <TextSpan>[
      TextSpan(text: 'Your home,\n', style: TextStyle(color: Colors.black)),
      TextSpan(text: 'safe and sound.', style: TextStyle(color: Colors.red)),
    ]),
    pictureURL: '$baseAssetURL/nest-home-packages.png',
  ),
};
