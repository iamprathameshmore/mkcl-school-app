import 'package:client/presentation/routes/routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/routes/routesName.dart';

void main() {
  if (kDebugMode) {
    return runApp(DevicePreview(
      enabled: true,
      builder: (context) => const ProviderScope(
        child: MyApp(),
      ),
    ));
  } else {
    return runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build');
    }
    return const MaterialApp(
        // theme: Provider.of<ThemeProvider>(context).themeDataStyle,
        debugShowCheckedModeBanner: false,
        initialRoute: Routesname.signIn,
        onGenerateRoute: AppRoutes.generateRoute);
  }
}
