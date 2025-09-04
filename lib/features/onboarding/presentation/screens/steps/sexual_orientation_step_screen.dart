import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class SexualOrientationStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const SexualOrientationStepScreen({super.key, required this.userProfile});

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

  List<Map<String, String>> _getLocalizedOrientationOptions() {
    return [
      {'title': context.l10n.lookingForMales, 'value': '寻找男性'},
      {'title': context.l10n.lookingForFemales, 'value': '寻找女性'},
      {'title': context.l10n.lookingForBoth, 'value': '均可'},
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
                context.l10n.whatIsYourSexualOrientation,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                context.l10n.pleaseSelectGenderYouAreLookingFor,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 性取向选项
              Expanded(
                child: Column(
                  children:
                      _getLocalizedOrientationOptions().map((option) {
                        return Column(
                          children: [
                            _buildOrientationOption(
                              option['title']!,
                              option['value']!,
                            ),
                            if (option !=
                                _getLocalizedOrientationOptions().last)
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
