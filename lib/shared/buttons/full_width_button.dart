import 'package:flutter/material.dart';

class FullWidthButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final double radius;
  final bool isLoading;
  final bool? isSecondary;
  final Color? color;
  const FullWidthButton({super.key, this.color, this.isSecondary = false, required this.text, required this.onPressed, this.radius = 16, this.isLoading = false});

  @override
  State<FullWidthButton> createState() => _FullWidthButtonState();
}

class _FullWidthButtonState extends State<FullWidthButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: FilledButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.radius)
                )
              ),
              side: widget.isSecondary == true ? WidgetStatePropertyAll(
                BorderSide(color: Colors.grey.shade300)
              ) : null,
              backgroundColor: WidgetStatePropertyAll(
                widget.color ??
                  (widget.isSecondary == true
                    ? Colors.white.withAlpha(0)
                    : theme.primaryColor)
              )
            ),
            onPressed: () => widget.onPressed(), 
            child: widget.isLoading ? Center(
              child: SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  padding: EdgeInsets.all(0),
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ) : Text(widget.text, style: theme.textTheme.titleLarge?.copyWith(color: widget.isSecondary == true ? Colors.black : Colors.white, fontWeight: FontWeight.w500))
          )
        )
      ],
    );
  }
}
