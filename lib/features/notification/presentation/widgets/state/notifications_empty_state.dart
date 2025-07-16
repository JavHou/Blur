import 'package:flutter/material.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class NotificationsEmptyState extends StatelessWidget {
  const NotificationsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          SizedBox(height: 142),
          Image.asset('assets/images/empty_state/no_notifications.png', width: 200, height: 200,),
          SizedBox(height: 16),
          Text('No Notifications Yet', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Text('No notification right now, notifications about your activity will show up here.', textAlign: TextAlign.center, style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade700, fontWeight: FontWeight.w400, letterSpacing: 0)),
          SizedBox(height: 32),
          FullWidthButton(
            color: Colors.black,
            onPressed: () {
              // context.push("/search");
            },
            text: 'Notifications Settings',
          ),
        ],
      ),
    );
  }
}
