import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:blur/app/routes/app_router.dart';
import 'package:blur/app/theme/app_theme.dart';
import 'package:blur/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:blur/features/abstraxion/services/account_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化账户服务
  await AccountService.instance.initialize();

  runApp(
    DevicePreview(
      enabled: false,
      // enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';
    setState(() {
      _locale = Locale(languageCode);
    });
  }

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
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
