import 'package:flutter/material.dart';
import 'package:world_news/screens/home_screen/home_screen.dart';
import 'package:world_news/screens/Search_screen/search_screen.dart';

class Bottomcontroller with ChangeNotifier {
  int currentIndex = 0;

  List<Widget> screens = [HomeScreen(), SearchScreen()];

  ontap({required int index}) {
    currentIndex = index;
    notifyListeners();
  }
}
