
import 'package:flutter/material.dart';
import 'package:rare_task/views/home_screen.dart';
import 'package:rare_task/views/profile_screen.dart';

class MainViewModel extends ChangeNotifier{

  int selectedIndex = 0;

   final List<Widget> pages = <Widget>[
    HomeScreen(),
   ProfileScreen()
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }


}