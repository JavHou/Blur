import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:readmore/readmore.dart';

class DatingAbout extends StatelessWidget {
  final DatingModel dating;

  const DatingAbout({super.key, required this.dating});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedAiBrain03,
              color: Colors.grey.shade800,
              size: 20,
            ),
            Text('匹配理由', style: theme.textTheme.labelLarge),
          ],
        ),
        SizedBox(height: 8),
        ReadMoreText(
          dating.matchReason,
          colorClickableText: Colors.blue.shade700,
          trimMode: TrimMode.Length,
          trimLength: 120,
          trimCollapsedText: 'Show more',
          trimExpandedText: ' Show less',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
