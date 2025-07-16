import 'package:flutter/material.dart';

class TitleAction extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const TitleAction({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, letterSpacing: 0),),
        if (onTap != null)
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                "View More",
                style: theme.textTheme.titleSmall?.copyWith(color: Colors.blueGrey.shade700, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blueGrey.shade700,
                size: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
