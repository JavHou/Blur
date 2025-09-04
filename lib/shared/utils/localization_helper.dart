import 'package:flutter/material.dart';
import 'package:blur/generated/l10n.dart';

class LocalizationHelper {
  static S of(BuildContext context) {
    return S.of(context);
  }

  static String getCurrentLanguage(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return locale.languageCode;
  }

  static bool isZhChinese(BuildContext context) {
    return getCurrentLanguage(context) == 'zh';
  }

  static bool isEnglish(BuildContext context) {
    return getCurrentLanguage(context) == 'en';
  }
}

// 扩展方法，方便在任何地方使用
extension LocalizationExtension on BuildContext {
  S get l10n => S.of(this);

  String get currentLanguage => Localizations.localeOf(this).languageCode;

  bool get isZhChinese => currentLanguage == 'zh';

  bool get isEnglish => currentLanguage == 'en';
}
