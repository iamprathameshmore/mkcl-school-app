import 'package:client/app.dart';
import 'package:client/core/theme/themedataprovider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  if (kDebugMode) {
    return runApp(DevicePreview(
        enabled: true,
        builder: (context) => ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
              child: const MyApp(),
            )));
  } else {
    return runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeDataStyle,
      debugShowCheckedModeBanner: false,
      home: const App(),
    );
  }
}
