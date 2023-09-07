import 'package:flutter/material.dart';
import 'package:project_template/modules/home/view/home_page.dart';
import 'package:project_template/router/router_name.dart';


class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      // case Routes.home:
      //   final AppArguments arguments = settings.arguments as AppArguments;
      //   return MaterialPageRoute(
      //     builder: (_) => ApplicationConfirmation(
      //       creditApplicationInformation: arguments.creditApplicationInformation,
      //       package: arguments.package,
      //     ),
      //   );

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