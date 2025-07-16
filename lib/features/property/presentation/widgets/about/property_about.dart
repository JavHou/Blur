import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class PropertyAbout extends StatelessWidget {
  final String about;
  const PropertyAbout({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Property', style: theme.textTheme.labelLarge),
        SizedBox(height: 8),
        ReadMoreText(
          about,
          colorClickableText: Colors.blue.shade700,
          trimMode: TrimMode.Length,
          trimLength: 120,
          trimCollapsedText: 'Show more',
          trimExpandedText: ' Show less',
          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade800, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
