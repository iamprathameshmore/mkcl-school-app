import 'package:client/core/theme/theme_style.dart';
import 'package:client/core/theme/themedataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.grey.shade700,
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.grey.shade700, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            actions: [
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
              SizedBox(
                width: 7,
              )
            ],
          ),
          SliverToBoxAdapter(
              child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey))),
                    child: Image.network(
                        fit: BoxFit.cover,
                        'https://random.imagecdn.app/500/150'),
                  ),
                ),
                Container(
                  height: 180,
                  // width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  // color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                              width: 3,
                              color: Theme.of(context).colorScheme.onSurface)),
                      child: Image.network(
                          'https://avatars.githubusercontent.com/u/91453437?v=4'),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'Iamprathameshmore',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 5),
              child: Container(
                child: Text(
                  'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.',
                  style: TextStyle(
                      // fontSize: 15,
                      // fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(Icons.phone_outlined,
                        size: 20, color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '+91 842-133-4187',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Iamprathameshmore@gmail.com',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.school_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Students - 100',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.batch_prediction_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Batches - 10',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          textAlign: TextAlign.center,
          "Mkcl School © 2024",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
