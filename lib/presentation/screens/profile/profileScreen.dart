import 'package:client/presentation/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: Colors.grey.shade700,
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Text(
              "Institute Profile",
              style: TextStyle(
                  color: Colors.grey.shade700, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      ModalRoute.withName('/'),
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  )),
              const SizedBox(width: 5),
            ],
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture
                  Center(
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              width: 3,
                              color: Theme.of(context).colorScheme.onSurface)),
                      child: const CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Institute Name
                  Center(
                    child: Text(
                      'MKCL Institute',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Institute Address
                  Center(
                    child: Text(
                      '123 Institute Lane, City, State, ZIP',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // About Us
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'About Us',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 21, vertical: 5),
                    child: Text(
                      'MKCL Institute offers a variety of courses to enhance the educational experience. We focus on quality education and innovative teaching methods.',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Contact Information
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ),
                  contactRow(
                    context,
                    Icons.phone_outlined,
                    '+91 842-133-4187',
                  ),
                  contactRow(
                    context,
                    Icons.email_outlined,
                    'info@mkcl.institute',
                  ),
                  contactRow(
                    context,
                    Icons.school_outlined,
                    'Total Students: 100',
                  ),
                  contactRow(
                    context,
                    Icons.batch_prediction_outlined,
                    'Total Batches: 10',
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          textAlign: TextAlign.center,
          "MKCL Institute © 2024",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  // Helper method to create contact rows
  Widget contactRow(BuildContext context, IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon,
                color: Theme.of(context).colorScheme.primary, size: 20),
          ),
          const SizedBox(width: 10),
          Text(
            info,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
    );
  }
}