import 'package:client/theme/theme_style.dart';

import 'package:client/routes/routes.dart';
import 'package:client/providers/theme/themedataprovider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'routes/routesName.dart';

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeRef = ref.watch(themeProvider);
    if (kDebugMode) {
      print('build');
    }
    return MaterialApp(
        themeMode: themeModeRef,
        theme: ThemeDataStyle.light, // Light theme
        darkTheme: ThemeDataStyle.dark,
        debugShowCheckedModeBanner: false,
        initialRoute: Routesname.signIn,
        onGenerateRoute: AppRoutes.generateRoute
        // home: ScrollableStudentListScreen(),
        );
  }
}
