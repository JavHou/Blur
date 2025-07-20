import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

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
    initializeDateFormatting('zh_CN'); // Initialize locale data for 'zh_CN'
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        // 时间图标
        HugeIcon(
          icon: HugeIcons.strokeRoundedClock01,
          color: Colors.grey.shade800,
          size: 18,
        ),
        const SizedBox(width: 4),

        // 时间文字
        Text(
          DateFormat('HH:mm EE', 'zh_CN').format(widget.dateTime),
          style: theme.textTheme.labelMedium?.copyWith(
            fontSize: 16 * 0.8,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 8),

        // 地点图标
        HugeIcon(
          icon: HugeIcons.strokeRoundedLocationFavourite01,
          color: Colors.grey.shade800,
          size: 18,
        ),
        const SizedBox(width: 4),

        // 地点文字
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
