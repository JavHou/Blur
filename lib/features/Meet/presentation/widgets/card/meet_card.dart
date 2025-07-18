import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class MeetCard extends StatefulWidget {
  final DatingModel dating;
  final String status;
  const MeetCard({super.key, required this.dating, this.status = 'Pending'});

  @override
  State<MeetCard> createState() => _MeetCardState();
}

class _MeetCardState extends State<MeetCard> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('zh_CN'); // Initialize locale data for 'zh_CN'
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        context.push('/dating/${widget.dating.id}/view', extra: widget.dating);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: 200, maxHeight: 200),
                    child: ImageWidget(imageUrl: widget.dating.coverImage),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),

                        boxShadow: [
                          BoxShadow(
                            color: Color(0x1F000000),
                            offset: Offset(0, 2),
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Text(
                        widget.status,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: const Color.fromARGB(255, 100, 55, 103),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "与 ${widget.dating.nickname} 的约会",
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedClock01,
                        color: Colors.grey.shade800,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        DateFormat(
                          'HH:mm EE',
                          'zh_CN',
                        ).format(widget.dating.dateTime),
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 16 * 0.8,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(width: 8),
                      HugeIcon(
                        icon: HugeIcons.strokeStandardLocation01,
                        color: Colors.grey.shade800,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        widget.dating.venueName,
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontSize: 16 * 0.8,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
