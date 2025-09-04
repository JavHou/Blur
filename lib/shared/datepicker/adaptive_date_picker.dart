import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:blur/app/utils/datetime/datetime.dart';

class AdaptiveDatePicker extends StatelessWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDatePicked;
  final String dateFormat;

  const AdaptiveDatePicker({
    super.key,
    required this.initialDate,
    required this.onDatePicked,
    required this.dateFormat,
  });

  DateTime get _firstDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, now.hour);
  }

  DateTime get _lastDate {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day + 7, now.hour);
  }

  Future<void> _pickDate(BuildContext context) async {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder:
            (ctx) => Container(
              height: 250,
              color: Colors.white,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: initialDate,
                minimumDate: _firstDate,
                maximumDate: _lastDate,
                onDateTimeChanged: onDatePicked,
                use24hFormat: true,
              ),
            ),
      );
    } else {
      // Material风格下，先选日期再选时间
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: _firstDate,
        lastDate: _lastDate,
      );
      if (pickedDate != null) {
        if (!context.mounted) return;
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate),
        );
        if (pickedTime != null) {
          final pickedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          onDatePicked(pickedDateTime);
        }
      }
    }
  }

  String _formatDate(DateTime date, BuildContext context) {
    try {
      // 获取当前语言环境
      final locale = Localizations.localeOf(context);
      final languageCode = locale.languageCode;

      // 根据语言环境设置格式
      String localeString;
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

      return DateFormat(dateFormat, localeString).format(date);
    } catch (_) {
      return toHumanReadableDateTime(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pickDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatDate(initialDate, context),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
