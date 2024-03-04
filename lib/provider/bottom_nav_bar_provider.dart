import 'package:flutter/cupertino.dart';

class BottomNav extends ChangeNotifier{
  int currentIndex = 0;

  void changeNavBar(int index){
    currentIndex = index;
    notifyListeners();
  }
}