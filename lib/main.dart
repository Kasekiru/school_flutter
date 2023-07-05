import 'package:flutter/material.dart';
import 'package:tugaskelompok1/splashscreen.dart';
import 'home_screen.dart';
import 'splashscreen.dart';
// import 'latihan m14.dart'; //ubah terus

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: const HomeScreen(),
      home: SplashScreen(),
      // home: LatihanM14(),
      debugShowCheckedModeBanner: false,
    );
  }
}
