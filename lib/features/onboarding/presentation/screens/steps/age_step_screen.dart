import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class AgeStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const AgeStepScreen({super.key, required this.userProfile});

  @override
  State<AgeStepScreen> createState() => _AgeStepScreenState();
}

class _AgeStepScreenState extends State<AgeStepScreen> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.userProfile.birthDate;
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedDate ?? DateTime.now().subtract(Duration(days: 18 * 365)),
      firstDate: DateTime.now().subtract(Duration(days: 100 * 365)),
      lastDate: DateTime.now().subtract(Duration(days: 18 * 365)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        widget.userProfile.birthDate = picked;
      });
    }
  }

  bool get canContinue => _selectedDate != null;

  int? get age {
    if (_selectedDate == null) return null;
    final now = DateTime.now();
    int age = now.year - _selectedDate!.year;
    if (now.month < _selectedDate!.month ||
        (now.month == _selectedDate!.month && now.day < _selectedDate!.day)) {
      age--;
    }
    return age;
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
                context.l10n.whatIsYourAge,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                context.l10n.ageDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 日期选择
              Expanded(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _selectDate,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color:
                              _selectedDate != null
                                  ? theme.primaryColor.withValues(alpha: 0.1)
                                  : Colors.white,
                          border: Border.all(
                            color:
                                _selectedDate != null
                                    ? theme.primaryColor
                                    : Colors.grey.shade300,
                            width: _selectedDate != null ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color:
                                  _selectedDate != null
                                      ? theme.primaryColor
                                      : Colors.grey.shade600,
                            ),
                            SizedBox(width: 12),
                            Text(
                              _selectedDate != null
                                  ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                  : context.l10n.selectBirthDate,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color:
                                    _selectedDate != null
                                        ? theme.primaryColor
                                        : Colors.grey.shade600,
                                fontWeight:
                                    _selectedDate != null
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                              ),
                            ),
                            Spacer(),
                            if (_selectedDate != null)
                              Text(
                                context.l10n.ageYears(age!),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      context.l10n.ageRequirement,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
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
}
