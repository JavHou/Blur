import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class UserMessageCard extends StatefulWidget {
  final String message;
  const UserMessageCard({super.key, required this.message});

  @override
  State<UserMessageCard> createState() => _UserMessageCardState();
}

class _UserMessageCardState extends State<UserMessageCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: NetworkImage('https://mighty.tools/mockmind-api/content/human/108.jpg'),
          ),
          SizedBox(width: 8),
          Container(
            constraints: BoxConstraints(maxWidth: 250),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.message, style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade900, letterSpacing: 0)),
                SizedBox(height: 4),
                Container(
                  width: 80,
                  child: Row(
                    children: [
                      HugeIcon(icon: HugeIcons.solidRoundedTickDouble01, color: Colors.green, size: 18),
                      SizedBox(width: 4),
                      Text('10:00 AM', style: theme.textTheme.bodySmall?.copyWith(color: Colors.blueGrey.shade500, letterSpacing: 0)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
