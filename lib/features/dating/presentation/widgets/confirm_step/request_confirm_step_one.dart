import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/shared/utils/localization_helper.dart';
import 'package:blur/shared/utils/datetime/localized_date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class RequestConfirmStepOne extends StatefulWidget {
  final DatingModel dating;
  const RequestConfirmStepOne({super.key, required this.dating});

  @override
  State<RequestConfirmStepOne> createState() => _RequestConfirmStepOneState();
}

class _RequestConfirmStepOneState extends State<RequestConfirmStepOne> {
  @override
  void initState() {
    super.initState();
    // 初始化日期格式化数据
    LocalizedDateFormatter.initializeAll();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              context.l10n.pleaseConfirmDatingInfo,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dating.nickname,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedLocation01,
                      color: Colors.grey.shade800,
                      size: 22,
                    ),

                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.dating.distance,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.blueGrey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey.shade300),

                SizedBox(height: 8),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedMaping,
                      color: Colors.grey.shade800,
                      size: 22,
                    ),

                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.dating.venueName,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.blueGrey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedArcher,
                      color: Colors.grey.shade800,
                      size: 22,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.dating.theme,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedCalendar01,
                      color: Colors.grey.shade800,
                      size: 22,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        LocalizedDateFormatter.formatDateTime(
                          widget.dating.dateTime,
                          context,
                        ),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
