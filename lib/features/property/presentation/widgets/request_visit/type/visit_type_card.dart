import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class VisitTypeCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final HugeIconData? icon;
  const VisitTypeCard({super.key, this.isSelected = false, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Colors.blue.shade700 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? Colors.blue.shade50 : Colors.white.withAlpha(0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? HugeIcon(icon: icon, color: isSelected ? Colors.blue.shade800 : Colors.black, size: 18,) : SizedBox(),
          SizedBox(width: 8),
          Text(title, style: theme.textTheme.labelMedium?.copyWith(color: isSelected ? Colors.blue.shade800 : Colors.blueGrey.shade800, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}