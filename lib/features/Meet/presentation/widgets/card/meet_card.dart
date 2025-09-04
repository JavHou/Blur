import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/meet/presentation/widgets/meta_info/meta_info_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class MeetCard extends StatefulWidget {
  final DatingModel dating;
  final String status;
  const MeetCard({super.key, required this.dating, this.status = 'Pending'});

  @override
  State<MeetCard> createState() => _MeetCardState();
}

class _MeetCardState extends State<MeetCard> {
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
                        context.l10n.dateWith(widget.dating.nickname),
                        style: theme.textTheme.labelLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  DatingMetaInfo(
                    dateTime: widget.dating.dateTime,
                    venueName: widget.dating.venueName,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
