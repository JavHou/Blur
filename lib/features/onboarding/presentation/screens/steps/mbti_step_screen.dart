import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class MBTIStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const MBTIStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<MBTIStepScreen> createState() => _MBTIStepScreenState();
}

class _MBTIStepScreenState extends State<MBTIStepScreen> {
  String? _selectedMBTI;

  final List<String> _mbtiTypes = [
    'INTJ',
    'INTP',
    'ENTJ',
    'ENTP',
    'INFJ',
    'INFP',
    'ENFJ',
    'ENFP',
    'ISTJ',
    'ISFJ',
    'ESTJ',
    'ESFJ',
    'ISTP',
    'ISFP',
    'ESTP',
    'ESFP',
  ];

  @override
  void initState() {
    super.initState();
    _selectedMBTI = widget.userProfile.mbtiType;
  }

  void _selectMBTI(String mbti) {
    setState(() {
      _selectedMBTI = mbti;
      widget.userProfile.mbtiType = mbti;
    });
  }

  bool get canContinue => _selectedMBTI != null;

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
                '你的MBTI类型是？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择你的MBTI人格类型，这将帮助我们更好地为你匹配',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // MBTI选项
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: _mbtiTypes.length,
                        itemBuilder: (context, index) {
                          final mbti = _mbtiTypes[index];
                          final isSelected = _selectedMBTI == mbti;

                          return GestureDetector(
                            onTap: () => _selectMBTI(mbti),
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? theme.primaryColor
                                        : Colors.white,
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? theme.primaryColor
                                          : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  mbti,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue.shade600),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '不知道自己的MBTI类型？可以稍后在线测试',
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
