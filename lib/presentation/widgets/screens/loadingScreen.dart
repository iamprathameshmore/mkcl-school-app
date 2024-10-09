import 'package:flutter/material.dart';

class Loadingwidget extends StatelessWidget {
  final String msg;
  const Loadingwidget({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                minHeight: 2,
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 30),
        alignment: Alignment.center,
        child: const Text(
          "Made with 🐞 23bg",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
