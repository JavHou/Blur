import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class PropertyListingEmptyState extends StatelessWidget {
  const PropertyListingEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          SizedBox(height: 142),
          Image.asset(
            'assets/images/empty_state/content_upload.png',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 16),
          Text(
            'Ready to sell your home?',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Realix is making it simpler to sell your home and move forward.',
            textAlign: TextAlign.center,
            style: theme.textTheme.labelMedium?.copyWith(
              color: Colors.blueGrey.shade700,
              fontWeight: FontWeight.w400,
              letterSpacing: 0,
            ),
          ),
          SizedBox(height: 32),
          FullWidthButton(
            color: Colors.black,
            onPressed: () {
              context.push("/property/add");
            },
            text: 'Add property',
          ),
        ],
      ),
    );
  }
}
