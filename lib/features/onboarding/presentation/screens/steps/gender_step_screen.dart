import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/utils/localization_helper.dart';

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

  List<Map<String, String>> _getLocalizedGenderOptions() {
    return [
      {'title': context.l10n.male, 'value': '男'},
      {'title': context.l10n.female, 'value': '女'},
      {'title': context.l10n.other, 'value': '其他'},
    ];
  }

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
                context.l10n.whatIsYourGender,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                context.l10n.genderDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 性别选项
              Expanded(
                child: Column(
                  children:
                      _getLocalizedGenderOptions().map((option) {
                        return Column(
                          children: [
                            _buildGenderOption(
                              option['title']!,
                              option['value']!,
                            ),
                            if (option != _getLocalizedGenderOptions().last)
                              SizedBox(height: 16),
                          ],
                        );
                      }).toList(),
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
