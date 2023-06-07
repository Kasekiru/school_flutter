import 'package:flutter/material.dart';
import 'home_screen.dart';
// import 'latihan m11.dart'; //ubah terus

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
      home: const HomeScreen(),
      // home: LatihanM11(),
      debugShowCheckedModeBanner: false,
    );
  }
}
