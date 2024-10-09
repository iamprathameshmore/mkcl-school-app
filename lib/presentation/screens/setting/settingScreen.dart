// // ignore_for_file: file_names

// import 'package:flutter/material.dart';

// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});

//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }

// class _SettingScreenState extends State<SettingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         surfaceTintColor: Theme.of(context).colorScheme.surface,
//         foregroundColor: Colors.grey,
//         title: const Text(
//           'Settings',
//           style: TextStyle(fontWeight: FontWeight.w500),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Text(
//                     "General",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 )
//               ],
//             ),
//             const Divider(
//               endIndent: 10,
//               indent: 10,
//               color: Colors.grey,
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             'Moods',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Theme.of(context).colorScheme.primary),
//                           )),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             'Moods',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Theme.of(context).colorScheme.primary),
//                           )),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             'Moods',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Theme.of(context).colorScheme.primary),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Text(
//                     "Terms and Conditions",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 )
//               ],
//             ),
//             const Divider(
//               endIndent: 10,
//               indent: 10,
//               color: Colors.grey,
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             'License',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Theme.of(context).colorScheme.primary),
//                           )),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             'Privacy Policy',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Theme.of(context).colorScheme.primary),
//                           )),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             'Terms and Conditions',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Theme.of(context).colorScheme.primary),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Text(
//                     "Accounts",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 )
//               ],
//             ),
//             const Divider(
//               endIndent: 10,
//               indent: 10,
//               color: Colors.grey,
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: Column(
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 5),
//                       child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             'Personal Information',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Theme.of(context).colorScheme.primary),
//                           )),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: const Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             'Log Out',
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.red),
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Colors.grey,
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // General Settings Section
            const _SectionTitle(title: "General"),
            _buildSettingOption(context, 'Moods', () {}),
            _buildSettingOption(context, 'Notifications', () {}),
            _buildSettingOption(context, 'Language', () {}),

            // Privacy Section
            const _SectionTitle(title: "Privacy"),
            _buildSettingOption(context, 'Privacy Policy', () {}),
            _buildSettingOption(context, 'Terms of Service', () {}),

            // Account Section
            const _SectionTitle(title: "Account"),
            _buildSettingOption(context, 'Personal Information', () {}),
            _buildSettingOption(context, 'Change Password', () {}),
            _buildSettingOption(context, 'Log Out', () {
              // Handle log out logic here
            }),
          ],
        ),
      ),
    );
  }

  // Helper method to build setting options
  Widget _buildSettingOption(
      BuildContext context, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}

// Widget for Section Title
class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ),
        const Divider(
          endIndent: 10,
          indent: 10,
          color: Colors.grey,
          height: 5,
        ),
      ],
    );
  }
}
