import 'package:extreme_work_outs/presentation/layouts/auth/auth_layout.dart';
import 'package:extreme_work_outs/presentation/layouts/home.layout.dart';
import 'package:extreme_work_outs/presentation/screens/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:extreme_work_outs/presentation/screens/auth/login_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => AuthLayout(child: LoginScreen()),
        );
      // case register:
      // return MaterialPageRoute(
      // builder: (_) => AuthLayout(child: RegisterScreen()),
      // );
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeLayout(child: HomeScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
