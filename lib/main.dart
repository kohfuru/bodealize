import 'package:bodealize/footer.dart';
import 'package:bodealize/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bodealize',
      home: HomePage(title: 'bodealize'),
    );
  }
}