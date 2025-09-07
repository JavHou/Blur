import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';

class DietaryHabitsStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const DietaryHabitsStepScreen({super.key, required this.userProfile});

  @override
  State<DietaryHabitsStepScreen> createState() =>
      _DietaryHabitsStepScreenState();
}

class _DietaryHabitsStepScreenState extends State<DietaryHabitsStepScreen> {
  List<String> _selectedHabits = [];

  final List<Map<String, String>> _habits = [
    {'title': '素食', 'icon': '🥗'},
    {'title': '清淡', 'icon': '🍃'},
    {'title': '爱吃辣', 'icon': '🌶️'},
    {'title': '爱吃甜', 'icon': '🍰'},
    {'title': '爱吃肉', 'icon': '🥩'},
    {'title': '海鲜', 'icon': '🦐'},
    {'title': '奶制品', 'icon': '🥛'},
    {'title': '坚果', 'icon': '🥜'},
    {'title': '水果', 'icon': '🍎'},
    {'title': '忌口', 'icon': '🚫'},
    {'title': '健康饮食', 'icon': '🥦'},
    {'title': '无特殊要求', 'icon': '😊'},
  ];

  @override
  void initState() {
    super.initState();
    _selectedHabits = List.from(widget.userProfile.dietaryHabits ?? []);
  }

  void _toggleHabit(String habit) {
    setState(() {
      if (_selectedHabits.contains(habit)) {
        _selectedHabits.remove(habit);
      } else {
        _selectedHabits.add(habit);
      }
      widget.userProfile.dietaryHabits = _selectedHabits;
    });
  }

  bool get canContinue => _selectedHabits.isNotEmpty;

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
                '你的饮食习惯？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择你的饮食习惯和偏好，可以多选',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 饮食习惯选项
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: _habits.length,
                        itemBuilder: (context, index) {
                          final habit = _habits[index];
                          final isSelected = _selectedHabits.contains(
                            habit['title'],
                          );

                          return GestureDetector(
                            onTap: () => _toggleHabit(habit['title']!),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? Colors.green.shade50
                                        : Colors.white,
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? Colors.green.shade500
                                          : Colors.grey.shade300,
                                  width: isSelected ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    habit['icon']!,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    habit['title']!,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color:
                                          isSelected
                                              ? Colors.green.shade700
                                              : Colors.black,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.w600
                                              : FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 16),

                    // 选择数量提示
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '已选择 ${_selectedHabits.length} 个饮食习惯',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(height: 16),

                    // 完成提示
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.celebration, color: Colors.blue.shade600),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '恭喜！完成所有信息后，AI将为你匹配最合适的伴侣',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ),
                        ],
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
