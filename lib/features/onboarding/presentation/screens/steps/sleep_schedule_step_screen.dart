import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';

class SleepScheduleStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const SleepScheduleStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<SleepScheduleStepScreen> createState() =>
      _SleepScheduleStepScreenState();
}

class _SleepScheduleStepScreenState extends State<SleepScheduleStepScreen> {
  String? _selectedSchedule;

  final List<Map<String, String>> _schedules = [
    {
      'title': '早睡早起',
      'description': '通常在22:00前睡觉，6:00-7:00起床',
      'value': '早睡早起',
      'icon': '🌅',
    },
    {
      'title': '晚睡晚起',
      'description': '通常在24:00后睡觉，8:00-10:00起床',
      'value': '晚睡晚起',
      'icon': '🌙',
    },
    {
      'title': '不规律',
      'description': '作息时间不固定，因工作或生活而调整',
      'value': '不规律',
      'icon': '⏰',
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedSchedule = widget.userProfile.sleepSchedule;
  }

  void _selectSchedule(String schedule) {
    setState(() {
      _selectedSchedule = schedule;
      widget.userProfile.sleepSchedule = schedule;
    });
  }

  bool get canContinue => _selectedSchedule != null;

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
                '你的作息时间？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择最符合你的作息时间类型',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 作息时间选项
              Expanded(
                child: Column(
                  children:
                      _schedules.map((schedule) {
                        return Column(
                          children: [
                            _buildScheduleOption(schedule),
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

  Widget _buildScheduleOption(Map<String, String> schedule) {
    final theme = Theme.of(context);
    final isSelected = _selectedSchedule == schedule['value'];

    return GestureDetector(
      onTap: () => _selectSchedule(schedule['value']!),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(schedule['icon']!, style: TextStyle(fontSize: 24)),
                SizedBox(width: 12),
                Text(
                  schedule['title']!,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isSelected ? theme.primaryColor : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                if (isSelected)
                  Icon(Icons.check_circle, color: theme.primaryColor, size: 24),
              ],
            ),
            SizedBox(height: 8),
            Text(
              schedule['description']!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color:
                    isSelected
                        ? theme.primaryColor.withValues(alpha: 0.8)
                        : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
