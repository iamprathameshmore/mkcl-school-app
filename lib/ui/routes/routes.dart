import 'package:client/ui/screens/auth/signInScreen.dart';
import 'package:client/ui/screens/auth/signUpScreen.dart';
import 'package:client/ui/screens/batch/addBatchScreen.dart';
import 'package:client/ui/screens/batch/batch.dart';
import 'package:client/ui/screens/home/homeScreen.dart';
import 'package:client/ui/screens/profile/instituteProfileScreen.dart';
import 'package:client/ui/screens/profile/profileScreen.dart';
import 'package:client/ui/screens/setting/settingScreen.dart';
import 'package:flutter/material.dart';

import 'routesName.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routesname.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case Routesname.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routesname.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routesname.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routesname.instituteProfile:
        return MaterialPageRoute(
            builder: (context) => const InstituteProfileScreen());
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
