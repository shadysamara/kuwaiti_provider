import 'package:flutter/material.dart';

class KuwaitiProvider extends ChangeNotifier {
  String name;
  int gender;
  bool isAccepted;
  setName(String name) {
    this.name = name;
    notifyListeners();
  }

  setGender(int gender) {
    this.gender = gender;
    notifyListeners();
  }

  setIsAccepted(bool isAccepted) {
    this.isAccepted = isAccepted;
    notifyListeners();
  }
}
