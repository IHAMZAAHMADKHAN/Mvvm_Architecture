import 'package:flutter/material.dart';
import 'package:mvvm_architecture/view/home_screen.dart';
import 'package:mvvm_architecture/view/login_screen.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view/signUp_screen.dart';
import 'package:mvvm_architecture/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case RoutesName.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      //can add more screen options here
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
