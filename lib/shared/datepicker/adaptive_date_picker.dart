import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blur/app/utils/datetime/datetime.dart';

class AdaptiveDatePicker extends StatelessWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDatePicked;

  AdaptiveDatePicker({
    Key? key,
    required this.initialDate,
    required this.onDatePicked,
  }) : super(key: key);

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
                onDateTimeChanged: onDatePicked,
              ),
            ),
      );
    } else {
      final picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        onDatePicked(picked);
      }
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
              "${toHumanReadableDateTime(initialDate)}",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
