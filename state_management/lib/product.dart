import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.id,
    required this.pictureURL,
    required this.title,
    required this.description,
  });

  final String id;
  final String pictureURL;
  final String title;
  final TextSpan description;
}