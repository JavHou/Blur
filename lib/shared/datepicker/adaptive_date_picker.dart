import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:blur/app/utils/datetime/datetime.dart';

class AdaptiveDatePicker extends StatelessWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDatePicked;
  final String dateFormat;

  AdaptiveDatePicker({
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
        builder: (context, child) {
          return Localizations.override(
            context: context,
            locale: const Locale('zh', 'CN'),
            delegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            child: child,
          );
        },
      );
      if (pickedDate != null) {
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate),
          builder: (context, child) {
            return Localizations.override(
              context: context,
              locale: const Locale('zh', 'CN'),
              delegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              child: child,
            );
          },
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

  String _formatDate(DateTime date) {
    try {
      return DateFormat(dateFormat, 'zh_CN').format(date);
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
              _formatDate(initialDate),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
