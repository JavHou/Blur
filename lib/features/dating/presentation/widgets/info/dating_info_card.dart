import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DatingnfoCard extends StatelessWidget {
  final DatingModel dating;
  const DatingnfoCard({super.key, required this.dating});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: Colors.grey.shade700,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  dating.personalityType,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedArcher,
                  color: Colors.grey.shade700,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  dating.theme,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedLocationFavourite01,
                  color: Colors.grey.shade700,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  dating.distance,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: Colors.black,
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
