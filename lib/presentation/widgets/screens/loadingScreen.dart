import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              msg.isEmpty ? " " : msg,
              style: const TextStyle(
                  color: Colors.grey,
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
        margin: const EdgeInsets.only(bottom: 30),
        alignment: Alignment.center,
        child: Text(
          "Made with 🐞 23bg",
          style: GoogleFonts.silkscreen(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
