import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class SexualOrientationStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const SexualOrientationStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<SexualOrientationStepScreen> createState() =>
      _SexualOrientationStepScreenState();
}

class _SexualOrientationStepScreenState
    extends State<SexualOrientationStepScreen> {
  String? _selectedOrientation;

  @override
  void initState() {
    super.initState();
    _selectedOrientation = widget.userProfile.sexualOrientation;
  }

  void _selectOrientation(String orientation) {
    setState(() {
      _selectedOrientation = orientation;
      widget.userProfile.sexualOrientation = orientation;
    });
  }

  bool get canContinue => _selectedOrientation != null;

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
              SizedBox(height: 24),

              // 标题
              Text(
                '你的性取向是？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择你寻找的对象性别',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 性取向选项
              Expanded(
                child: Column(
                  children: [
                    _buildOrientationOption('寻找男性', '寻找男性'),
                    SizedBox(height: 16),
                    _buildOrientationOption('寻找女性', '寻找女性'),
                    SizedBox(height: 16),
                    _buildOrientationOption('均可', '均可'),
                  ],
                ),
              ),

              SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrientationOption(String title, String value) {
    final theme = Theme.of(context);
    final isSelected = _selectedOrientation == value;

    return GestureDetector(
      onTap: () => _selectOrientation(value),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? theme.primaryColor.withValues(alpha: 0.1)
                  : Colors.white,
          border: Border.all(
            color: isSelected ? theme.primaryColor : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected ? theme.primaryColor : Colors.black,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            Spacer(),
            if (isSelected)
              Icon(Icons.check_circle, color: theme.primaryColor, size: 24),
          ],
        ),
      ),
    );
  }
}
