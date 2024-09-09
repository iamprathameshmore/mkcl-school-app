import 'package:client/core/theme/theme_style.dart';
import 'package:client/core/theme/themedataprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

DateTime now = DateTime.now();

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
// DateTime dateTime = DateTime.parse(variableName); <-- If you are using String as dateTime.
  String formattedDate = DateFormat.MMMEd().format(now);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Container(
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
                      IconButton(
                        onPressed: () {
                          themeProvider.changeTheme();
                        },
                        icon: Icon(
                          themeProvider.themeDataStyle == ThemeDataStyle.dark
                              ? Icons.sunny
                              : Icons.nightlight,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          themeProvider.themeDataStyle == ThemeDataStyle.dark
                              ? 'Dark'
                              : 'Light',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Container(
              //     width: 128.0,
              //     height: 128.0,
              //     margin: const EdgeInsets.only(
              //       top: 24.0,
              //       bottom: 64.0,
              //     ),
              //     clipBehavior: Clip.antiAlias,
              //     decoration: BoxDecoration(
              //         color: Colors.black26,
              //         shape: BoxShape.rectangle,
              //         borderRadius: BorderRadius.circular(1)),
              //     child: Center(child: Text('hello'))),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                child: Column(
                  children: [],
                ),
              ),
              Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      'Home',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )),
              Material(
                type: MaterialType.transparency,
                child: ListTile(
                  onTap: () {},
                  // leading: Icon(Icons.account_circle_rounded),
                  title: Text(
                    'Profile',
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
              //       // leading: Icon(Icons.favorite),
              //       title: Text(
              //         'Mkcl News',
              //         style: TextStyle(
              //           color: Theme.of(context).colorScheme.primary,
              //         ),
              //       ),
              //     )),
              Material(
                type: MaterialType.transparency,
                child: ListTile(
                  onTap: () {},
                  // leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    onTap: () {},
                    // leading: Icon(Icons.settings),
                    title: Text(
                      'License',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )),
              Material(
                type: MaterialType.transparency,
                child: ListTile(
                  onTap: () {},
                  // leading: Icon(Icons.settings),
                  title: Text(
                    'Feedback',
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
                    Navigator.pop(context);
                  },
                  // leading: Icon(Icons.settings),
                  title: Text(
                    'Log Out',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text(
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
