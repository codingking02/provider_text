// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/Material.dart';

class ValueNotifierProvider {
  ValueNotifier<String> myVal = ValueNotifier('hello');
  void doSomething() {
    myVal.value = 'zeyad';
    myVal.notifyListeners();
    print(myVal.value);
  }
}
