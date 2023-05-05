import 'package:flutter/material.dart';

class TempClass extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  set countUp(inp) {
    _counter++;
    notifyListeners();
  }
}
