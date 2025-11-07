import 'package:flutter/material.dart';
import 'package:weatherapp/features%20/allnews/presentation/pages/newshomepage.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsHomePage(),
    );
  }
}