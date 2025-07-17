import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class HobbiesStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const HobbiesStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<HobbiesStepScreen> createState() => _HobbiesStepScreenState();
}

class _HobbiesStepScreenState extends State<HobbiesStepScreen> {
  List<String> _selectedHobbies = [];

  final List<Map<String, String>> _hobbies = [
    {'title': '电影', 'icon': '🎬'},
    {'title': '音乐', 'icon': '🎵'},
    {'title': '户外运动', 'icon': '🏃‍♂️'},
    {'title': '美食探店', 'icon': '🍽️'},
    {'title': '阅读', 'icon': '📚'},
    {'title': '旅行', 'icon': '✈️'},
    {'title': '游戏', 'icon': '🎮'},
    {'title': '摄影', 'icon': '📸'},
    {'title': '健身', 'icon': '💪'},
    {'title': '绘画', 'icon': '🎨'},
    {'title': '写作', 'icon': '✍️'},
    {'title': '烹饪', 'icon': '👨‍🍳'},
    {'title': '舞蹈', 'icon': '💃'},
    {'title': '购物', 'icon': '🛍️'},
    {'title': '宠物', 'icon': '🐕'},
    {'title': '手工', 'icon': '🧵'},
    {'title': '收藏', 'icon': '🏺'},
    {'title': '园艺', 'icon': '🌱'},
  ];

  @override
  void initState() {
    super.initState();
    _selectedHobbies = List.from(widget.userProfile.hobbies ?? []);
  }

  void _toggleHobby(String hobby) {
    setState(() {
      if (_selectedHobbies.contains(hobby)) {
        _selectedHobbies.remove(hobby);
      } else {
        _selectedHobbies.add(hobby);
      }
      widget.userProfile.hobbies = _selectedHobbies;
    });
  }

  bool get canContinue => _selectedHobbies.isNotEmpty;

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
                '你的兴趣爱好？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择你的兴趣爱好，可以多选',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 爱好选项
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
                        itemCount: _hobbies.length,
                        itemBuilder: (context, index) {
                          final hobby = _hobbies[index];
                          final isSelected = _selectedHobbies.contains(
                            hobby['title'],
                          );

                          return GestureDetector(
                            onTap: () => _toggleHobby(hobby['title']!),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? theme.primaryColor.withValues(
                                          alpha: 0.1,
                                        )
                                        : Colors.white,
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? theme.primaryColor
                                          : Colors.grey.shade300,
                                  width: isSelected ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    hobby['icon']!,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    hobby['title']!,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color:
                                          isSelected
                                              ? theme.primaryColor
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
                        '已选择 ${_selectedHobbies.length} 个兴趣爱好',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
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
