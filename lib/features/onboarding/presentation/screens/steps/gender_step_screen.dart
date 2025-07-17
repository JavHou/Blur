import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class GenderStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const GenderStepScreen({super.key, required this.userProfile});

  @override
  State<GenderStepScreen> createState() => _GenderStepScreenState();
}

class _GenderStepScreenState extends State<GenderStepScreen> {
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _selectedGender = widget.userProfile.gender;
  }

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
      widget.userProfile.gender = gender;
    });
  }

  bool get canContinue => _selectedGender != null;

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
                '你的性别是？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择你的性别',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 性别选项
              Expanded(
                child: Column(
                  children: [
                    _buildGenderOption('男', '男'),
                    SizedBox(height: 16),
                    _buildGenderOption('女', '女'),
                    SizedBox(height: 16),
                    _buildGenderOption('其他', '其他'),
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

  Widget _buildGenderOption(String title, String value) {
    final theme = Theme.of(context);
    final isSelected = _selectedGender == value;

    return GestureDetector(
      onTap: () => _selectGender(value),
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
