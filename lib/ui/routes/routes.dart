import 'package:flutter/material.dart';

import '../screens/signUpScreen.dart';
import '../screens/signinScreen.dart';
import 'routesName.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case Routesname.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      // case Routesname.home:
      //   return MaterialPageRoute(builder: (context) => SignUpScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Page Found'),
            ),
          );
        });
    }
  }
}
