import 'package:expense_tracker_firebase/Screens/login_page.dart';
import 'package:expense_tracker_firebase/Screens/register_page.dart';
import 'package:flutter/material.dart';

import '../Screens/home_page.dart';

class Routes {
  static const String signIn = '/';
  static const String register = '/profile';
  static const String home='/home';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signIn:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}
