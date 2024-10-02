import 'package:client/presentation/screens/auth/signInScreen.dart';
import 'package:client/presentation/screens/profile/instituteProfileScreen.dart';
import 'package:client/presentation/screens/profile/profileScreen.dart';
import 'package:client/presentation/screens/setting/settingScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime now = DateTime.now();

class HomeDrawer extends ConsumerStatefulWidget {
  const HomeDrawer({super.key});

  @override
  ConsumerState<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends ConsumerState<HomeDrawer> {
// DateTime dateTime = DateTime.parse(variableName); <-- If you are using String as dateTime.
  String formattedDate = DateFormat.MMMEd().format(now);

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: SizedBox(
        width: 150,
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formattedDate,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                // height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Prathamesh More',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Iamprathameshmore',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const Column(
                children: [],
              ),
              Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const InstituteProfileScreen()),
                      );
                    },
                    title: Text(
                      'Institute',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )),
              Material(
                type: MaterialType.transparency,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  },
                  // leading: Icon(Icons.account_circle_rounded),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingScreen()));
                  },
                  // leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              // Material(
              //     type: MaterialType.transparency,
              //     child: ListTile(
              //       onTap: () {},
              //       // leading: Icon(Icons.settings),
              //       title: Text(
              //         'License',
              //         style: TextStyle(
              //           color: Theme.of(context).colorScheme.primary,
              //         ),
              //       ),
              //     )),
              // Material(
              //   type: MaterialType.transparency,
              //   child: ListTile(
              //     onTap: () {},
              //     // leading: Icon(Icons.settings),
              //     title: Text(
              //       'Feedback',
              //       style: TextStyle(
              //         color: Theme.of(context).colorScheme.primary,
              //       ),
              //     ),
              //   ),
              // ),
              Material(
                type: MaterialType.transparency,
                child: ListTile(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                        (route) => false);
                  },
                  // leading: Icon(Icons.settings),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text(
                    'Terms of Service | Privacy Policy',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
