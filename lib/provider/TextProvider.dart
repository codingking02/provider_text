import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  String text = "Hello";

  void chaangetext() {
    text = "goodbye";
    print("----------");
    notifyListeners();
  }
}
