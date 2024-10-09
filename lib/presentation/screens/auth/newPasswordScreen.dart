import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewPasswordScreen extends ConsumerWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        title: Text(
          'Forget User',
          style: TextStyle(
              color: Colors.indigo.shade500, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
    );
  }
}
