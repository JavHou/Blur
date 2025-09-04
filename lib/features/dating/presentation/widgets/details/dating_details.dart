import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/shared/utils/localization_helper.dart';
import 'package:blur/shared/utils/datetime/localized_date_formatter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DatingDetails extends StatefulWidget {
  final DatingModel dating;

  const DatingDetails({super.key, required this.dating});

  @override
  State<DatingDetails> createState() => _DatingDetailsState();
}

class _DatingDetailsState extends State<DatingDetails> {
  @override
  void initState() {
    super.initState();
    // 初始化日期格式化数据
    LocalizedDateFormatter.initializeAll();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.locationDetails, style: theme.textTheme.labelLarge),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedArcher,
                    color: Colors.grey.shade800,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    context.l10n.theme,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.blueGrey.shade700,
                      letterSpacing: 0,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      widget.dating.theme,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              border(12),
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedMaping,
                    color: Colors.grey.shade800,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    context.l10n.address,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.blueGrey.shade700,
                      letterSpacing: 0,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      widget.dating.venueName,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              border(12),
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedLocationFavourite01,
                    color: Colors.grey.shade800,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    context.l10n.distance,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.blueGrey.shade700,
                      letterSpacing: 0,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      widget.dating.distance,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              border(12),
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedClock01,
                    color: Colors.grey.shade800,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    context.l10n.time,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.blueGrey.shade700,
                      letterSpacing: 0,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      LocalizedDateFormatter.formatDateTime(
                        widget.dating.dateTime,
                        context,
                      ),
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget border(double spacing) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: Colors.grey.shade300,
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}
