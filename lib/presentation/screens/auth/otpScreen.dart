import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'OTP Verfication',
          style: TextStyle(
              color: Colors.indigo.shade500, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("OTP Verification")],
      ),
    );
  }
}
