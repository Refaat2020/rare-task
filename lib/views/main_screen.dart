import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rare_task/core/providers.dart';



class MainScreen extends StatelessWidget {
  static const route = "/MainScreen";

  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final mainProvider = ref.watch(mainScreenProvider);
        return Scaffold(

          body: mainProvider.pages.elementAt(mainProvider.selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'User',
              ),
            ],
            currentIndex:  mainProvider.selectedIndex,
            onTap:  mainProvider.onItemTapped,
          ),
        );
      },
     
    );
  }
}