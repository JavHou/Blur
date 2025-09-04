import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatPrice(double amount, BuildContext context) {
  // 获取当前语言环境
  final locale = Localizations.localeOf(context);
  final localeString =
      '${locale.languageCode}_${locale.countryCode ?? locale.languageCode.toUpperCase()}';

  final formatter = NumberFormat("#,##0.0", localeString);

  return formatter.format(amount);
}
