
import 'package:flutter/cupertino.dart';
import 'package:rare_task/views/home_screen.dart';
import 'package:rare_task/views/login_screen.dart';
import 'package:rare_task/views/main_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) =>  LoginScreen());
      case HomeScreen.route:
        return CupertinoPageRoute(builder: (_) =>  HomeScreen());
      case MainScreen.route:
        return CupertinoPageRoute(builder: (_) =>  const MainScreen());
      default:
        return null;
    }
  }
}
