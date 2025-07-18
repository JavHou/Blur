import 'package:flutter/material.dart';

class TitleFont extends StatelessWidget {
  final String title;
  final double fontSize;
  const TitleFont({super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ShaderMask(
      shaderCallback:
          (bounds) => LinearGradient(
            colors: [Color(0xFF7951FF), Color(0xFFEB52FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds),
      child: Text(
        title,
        style: theme.textTheme.headlineLarge?.copyWith(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
