import 'package:blinkit/repository/Screen/Splash/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blinkit',
      debugShowCheckedModeBanner: false,

      home: Splashscreen(),
    );
  }
}
