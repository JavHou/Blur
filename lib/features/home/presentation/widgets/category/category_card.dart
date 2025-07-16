import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final HugeIconData icon;
  final Function()? onPressed;
  const CategoryCard({super.key, required this.color, required this.title, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8, vertical: 16)),
        backgroundColor: WidgetStatePropertyAll(color.withAlpha(10)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          side: BorderSide(color: color.withAlpha(50),),
          borderRadius: BorderRadius.circular(16))),
        overlayColor: WidgetStatePropertyAll(Colors.grey.shade200.withAlpha(100)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HugeIcon(icon: icon, color: color, size: 24,),
          // SizedBox(height: 8,),
          // Text(title, style: theme.textTheme.titleMedium?.copyWith(color: Colors.black87),),
        ],
      ),
    );
  }
}
