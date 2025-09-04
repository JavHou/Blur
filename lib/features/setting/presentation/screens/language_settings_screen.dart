import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  String _currentLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
  }

  Future<void> _loadCurrentLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('language_code') ?? 'en';
    });
  }

  Future<void> _changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
    setState(() {
      _currentLanguage = languageCode;
    });

    // 重启应用或通知应用语言已更改
    // 这里可以使用状态管理方案如Provider、Bloc等
    if (mounted) {
      // 显示一个对话框告知用户重启应用
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text(context.l10n.settings),
              content: Text(context.l10n.restartApp),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(context.l10n.ok),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settings)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.languageSettings,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(context.l10n.english),
              trailing:
                  _currentLanguage == 'en'
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
              onTap: () => _changeLanguage('en'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(context.l10n.chinese),
              trailing:
                  _currentLanguage == 'zh'
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
              onTap: () => _changeLanguage('zh'),
            ),
          ],
        ),
      ),
    );
  }
}
