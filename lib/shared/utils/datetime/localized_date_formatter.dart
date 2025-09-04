import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class LocalizedDateFormatter {
  // 初始化所有支持的地区数据
  static Future<void> initializeAll() async {
    await initializeDateFormatting('zh_CN');
    await initializeDateFormatting('en_US');
  }

  // 格式化日期时间
  static String formatDateTime(
    DateTime dateTime,
    BuildContext context, {
    String? customPattern,
  }) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    String localeString;
    String pattern;

    if (customPattern != null) {
      pattern = customPattern;
    } else {
      // 根据语言环境设置默认格式
      switch (languageCode) {
        case 'zh':
          pattern = 'HH:mm EE yyyy-MM-dd';
          break;
        case 'en':
          pattern = 'EE MMM dd, yyyy HH:mm';
          break;
        default:
          pattern = 'EE MMM dd, yyyy HH:mm';
      }
    }

    // 设置本地化字符串
    switch (languageCode) {
      case 'zh':
        localeString = 'zh_CN';
        break;
      case 'en':
        localeString = 'en_US';
        break;
      default:
        localeString = 'en_US';
    }

    try {
      return DateFormat(pattern, localeString).format(dateTime);
    } catch (_) {
      // 如果格式化失败，使用默认格式
      return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    }
  }

  // 只格式化日期
  static String formatDate(DateTime dateTime, BuildContext context) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    String localeString;
    String pattern;

    switch (languageCode) {
      case 'zh':
        localeString = 'zh_CN';
        pattern = 'yyyy年MM月dd日';
        break;
      case 'en':
        localeString = 'en_US';
        pattern = 'MMM dd, yyyy';
        break;
      default:
        localeString = 'en_US';
        pattern = 'MMM dd, yyyy';
    }

    try {
      return DateFormat(pattern, localeString).format(dateTime);
    } catch (_) {
      return DateFormat('yyyy-MM-dd').format(dateTime);
    }
  }

  // 只格式化时间
  static String formatTime(DateTime dateTime, BuildContext context) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    String localeString;
    String pattern = 'HH:mm';

    switch (languageCode) {
      case 'zh':
        localeString = 'zh_CN';
        break;
      case 'en':
        localeString = 'en_US';
        break;
      default:
        localeString = 'en_US';
    }

    try {
      return DateFormat(pattern, localeString).format(dateTime);
    } catch (_) {
      return DateFormat('HH:mm').format(dateTime);
    }
  }

  // 格式化时间和星期（如：14:30 Mon）
  static String formatTimeWithWeekday(DateTime dateTime, BuildContext context) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    String localeString;
    String pattern = 'HH:mm EE';

    switch (languageCode) {
      case 'zh':
        localeString = 'zh_CN';
        break;
      case 'en':
        localeString = 'en_US';
        break;
      default:
        localeString = 'en_US';
    }

    try {
      return DateFormat(pattern, localeString).format(dateTime);
    } catch (_) {
      return DateFormat('HH:mm').format(dateTime);
    }
  }

  // 格式化相对时间（比如："2小时前"）
  static String formatRelativeTime(DateTime dateTime, BuildContext context) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    if (difference.inMinutes < 1) {
      return languageCode == 'zh' ? '刚刚' : 'Just now';
    } else if (difference.inHours < 1) {
      final minutes = difference.inMinutes;
      return languageCode == 'zh'
          ? '$minutes分钟前'
          : '$minutes minute${minutes > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 1) {
      final hours = difference.inHours;
      return languageCode == 'zh'
          ? '$hours小时前'
          : '$hours hour${hours > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return languageCode == 'zh'
          ? '$days天前'
          : '$days day${days > 1 ? 's' : ''} ago';
    } else {
      return formatDate(dateTime, context);
    }
  }
}
