import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class HobbiesStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const HobbiesStepScreen({super.key, required this.userProfile});

  @override
  State<HobbiesStepScreen> createState() => _HobbiesStepScreenState();
}

class _HobbiesStepScreenState extends State<HobbiesStepScreen> {
  List<String> _selectedHobbies = [];

  List<Map<String, String>> _getLocalizedHobbies(BuildContext context) {
    return [
      {'title': context.l10n.movies, 'icon': '🎬'},
      {'title': context.l10n.music, 'icon': '🎵'},
      {'title': context.l10n.outdoorSports, 'icon': '🏃‍♂️'},
      {'title': context.l10n.foodExploring, 'icon': '🍽️'},
      {'title': context.l10n.reading, 'icon': '📚'},
      {'title': context.l10n.travel, 'icon': '✈️'},
      {'title': context.l10n.gaming, 'icon': '🎮'},
      {'title': context.l10n.photography, 'icon': '📸'},
      {'title': context.l10n.fitness, 'icon': '💪'},
      {'title': context.l10n.painting, 'icon': '🎨'},
      {'title': context.l10n.writing, 'icon': '✍️'},
      {'title': context.l10n.cooking, 'icon': '👨‍🍳'},
      {'title': context.l10n.dancing, 'icon': '💃'},
      {'title': context.l10n.shopping, 'icon': '🛍️'},
      {'title': context.l10n.pets, 'icon': '🐕'},
      {'title': context.l10n.crafts, 'icon': '🧵'},
      {'title': context.l10n.collecting, 'icon': '🏺'},
      {'title': context.l10n.gardening, 'icon': '🌱'},
    ];
  }

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
                context.l10n.yourHobbies,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                context.l10n.hobbiesDescription,
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
                        itemCount: _getLocalizedHobbies(context).length,
                        itemBuilder: (context, index) {
                          final hobby = _getLocalizedHobbies(context)[index];
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
                        context.l10n.selectedHobbiesCount(
                          _selectedHobbies.length,
                        ),
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
