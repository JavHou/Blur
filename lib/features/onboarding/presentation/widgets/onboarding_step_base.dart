import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

abstract class OnboardingStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const OnboardingStepScreen({
    super.key,
    required this.userProfile,
    required this.onNext,
    required this.onPrevious,
  });
}

abstract class OnboardingStepScreenState<T extends OnboardingStepScreen>
    extends State<T> {
  bool get canContinue;
  String get title;
  String get subtitle;
  Widget get content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 返回按钮
              IconButton(
                onPressed: widget.onPrevious,
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 24),

              // 标题
              Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 内容
              Expanded(child: content),

              SizedBox(height: 24),

              // 继续按钮
              FullWidthButton(
                text: '继续',
                onPressed: canContinue ? widget.onNext : () {},
                color: canContinue ? Colors.black : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
