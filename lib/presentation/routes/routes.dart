import 'package:client/presentation/screens/auth/forgetPasswordScreen.dart';
import 'package:client/presentation/screens/auth/newPasswordScreen.dart';

import 'package:client/presentation/screens/auth/signInScreen.dart';
import 'package:client/presentation/screens/auth/signUpScreen.dart';
import 'package:client/presentation/screens/batch/addBatchScreen.dart';
import 'package:client/presentation/screens/batch/batch.dart';
import 'package:client/presentation/screens/home/homeScreen.dart';

import 'package:client/presentation/screens/profile/profileScreen.dart';
import 'package:client/presentation/screens/setting/settingScreen.dart';
import 'package:flutter/material.dart';

import 'routesName.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.signIn:
        return MaterialPageRoute(builder: (context) => SignInScreen());

      case Routesname.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      case Routesname.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());

      case Routesname.newPassword:
        return MaterialPageRoute(
            builder: (context) => const NewPasswordScreen());

      case Routesname.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routesname.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      case Routesname.batch:
        return MaterialPageRoute(builder: (context) => const Batch());

      case Routesname.addBatch:
        return MaterialPageRoute(builder: (context) => const AddBatchScreen());

      case Routesname.setting:
        return MaterialPageRoute(builder: (context) => const SettingScreen());

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
