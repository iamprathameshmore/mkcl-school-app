import 'package:client/presentation/screens/auth/forget_password/forgetPasswordScreen.dart';
import 'package:client/presentation/screens/auth/signin/signInScreen.dart';
import 'package:client/presentation/screens/auth/signup/signUpScreen.dart';
import 'package:client/presentation/screens/batch/addBatchScreen.dart';
import 'package:client/presentation/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'routesName.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case Routesname.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      case Routesname.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());

      case Routesname.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routesname.addBatch:
        return MaterialPageRoute(builder: (context) => const AddBatchScreen());

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
