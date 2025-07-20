import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/widgets/info/dating_info_card.dart';
import 'package:blur/features/meet/presentation/widgets/meta_info/meta_info_card.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerticalDatingCard extends StatefulWidget {
  final DatingModel dating;
  const VerticalDatingCard({super.key, required this.dating});

  @override
  State<VerticalDatingCard> createState() => _VerticalDatingCardState();
}

class _VerticalDatingCardState extends State<VerticalDatingCard> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: 200,
                          maxHeight: 300,
                        ),
                        child: ImageWidget(imageUrl: widget.dating.coverImage),
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
                            "${widget.dating.nickname}",
                            style: theme.textTheme.labelLarge,
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 2),
                      DatingMetaInfo(
                        dateTime: widget.dating.dateTime,
                        venueName: widget.dating.venueName,
                      ),
                      SizedBox(height: 16),
                      DatingnfoCard(dating: widget.dating),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
