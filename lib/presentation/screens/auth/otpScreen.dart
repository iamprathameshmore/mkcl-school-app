import "package:client/core/theme/theme_style.dart";
import "package:client/presentation/providers/themedataprovider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("OTP Verification")],
      ),
    );
  }
}
