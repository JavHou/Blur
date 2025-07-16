import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class PropertyRating extends StatelessWidget {
  const PropertyRating({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        HugeIcon(icon: HugeIcons.solidRoundedStar, color: Colors.orange, size: 20),
        SizedBox(width: 4),
        RichText(
          text: TextSpan(
            style: theme.textTheme.labelMedium,
            children: [
              TextSpan(text: '4.5 '),
              TextSpan(
                text: '(142 reviews)',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontSize: 16 * 0.8,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
