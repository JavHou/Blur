import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SelectableCategoryCard extends StatefulWidget {
  final String title;
  final HugeIconData icon;
  final bool isSelected;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  const SelectableCategoryCard({
    super.key,
    this.padding,
    required this.title,
    required this.onTap,
    required this.icon,
    required this.isSelected,
  });

  @override
  State<SelectableCategoryCard> createState() => _SelectableCategoryCardState();
}

class _SelectableCategoryCardState extends State<SelectableCategoryCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(16),
      overlayColor: WidgetStatePropertyAll(Colors.blue.withAlpha(10)),
      child: Container(
        padding:
            widget.padding != null
                ? widget.padding
                : EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          // color: widget.isSelected ? theme.colorScheme.primary.withAlpha(50) : Colors.white,
          border: Border.all(
            color:
                widget.isSelected
                    ? Colors.purple.shade700
                    : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HugeIcon(
              icon: widget.icon,
              color:
                  widget.isSelected
                      ? Colors.purple.shade700
                      : theme.colorScheme.onSurface,
              size: 22,
            ),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                widget.title,
                softWrap: true,
                style: theme.textTheme.labelMedium?.copyWith(
                  color:
                      widget.isSelected
                          ? Colors.purple.shade700
                          : theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
