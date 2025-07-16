import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class ItemBorder extends StatelessWidget {
  final double spacing;
  const ItemBorder({super.key, this.spacing = 16.0});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300,
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}
