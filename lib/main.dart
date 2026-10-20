
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const GarderieApp());
}

class GarderieApp extends StatelessWidget {
  const GarderieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ma Garderie',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: const Color(0xFFF3F8FF),
      ),
      home: const SplashScreen(),
    );
  }
}
