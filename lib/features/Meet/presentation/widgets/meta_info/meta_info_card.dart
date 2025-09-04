import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/shared/utils/datetime/localized_date_formatter.dart';

class DatingMetaInfo extends StatefulWidget {
  final DateTime dateTime;
  final String venueName;
  const DatingMetaInfo({
    super.key,
    required this.dateTime,
    required this.venueName,
  });
  @override
  State<DatingMetaInfo> createState() => _DatingMetaInfoState();
}

class _DatingMetaInfoState extends State<DatingMetaInfo> {
  @override
  void initState() {
    super.initState();
    // 初始化日期格式化数据
    LocalizedDateFormatter.initializeAll();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // Time icon
        HugeIcon(
          icon: HugeIcons.strokeRoundedClock01,
          color: Colors.grey.shade800,
          size: 18,
        ),
        const SizedBox(width: 4),

        // Time text
        Text(
          LocalizedDateFormatter.formatTimeWithWeekday(
            widget.dateTime,
            context,
          ),
          style: theme.textTheme.labelMedium?.copyWith(
            fontSize: 16 * 0.8,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 8),

        // Location icon
        HugeIcon(
          icon: HugeIcons.strokeRoundedLocationFavourite01,
          color: Colors.grey.shade800,
          size: 18,
        ),
        const SizedBox(width: 4),

        // Location text
        Text(
          widget.venueName,
          style: theme.textTheme.labelMedium?.copyWith(
            fontSize: 16 * 0.8,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
