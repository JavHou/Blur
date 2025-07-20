import 'package:blur/features/match/presentation/screens/match_screen.dart';
import 'package:blur/shared/logo_fonts/title_fonts.dart';
import 'package:flutter/material.dart';

class MatchTab extends StatelessWidget {
  const MatchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: TitleFont(title: 'Blur', fontSize: 32),
      ),
      body: MatchScreen(),
    );
  }
}
