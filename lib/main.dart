import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:blur/app/routes/app_router.dart';
import 'package:blur/app/theme/app_theme.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      // enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Doctor UI Kit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
