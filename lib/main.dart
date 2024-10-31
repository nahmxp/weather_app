// lib/main.dart
import 'package:flutter/material.dart';
import 'weatherapp.dart'; // Import WeatherApp from a separate file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherApp(),
    );
  }
}

