import 'package:flutter/material.dart';
import 'package:project_template/modules/home/home_screen.dart';
import 'package:project_template/modules/sign_up/details_screen.dart';
import 'package:project_template/modules/sign_up/password_screen.dart';
import 'package:project_template/modules/sign_up/phone_screen.dart';
import 'package:project_template/router/route_name.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.phone:
        return MaterialPageRoute(builder: (_) => const PhoneScreen());

      case RouteName.details:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());

      case RouteName.password:
        return MaterialPageRoute(builder: (_) => const PasswordScreen());

      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('No route define'),
        ),
      ),
    );
  }
}
