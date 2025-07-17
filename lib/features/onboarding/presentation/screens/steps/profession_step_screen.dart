import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class ProfessionStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const ProfessionStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<ProfessionStepScreen> createState() => _ProfessionStepScreenState();
}

class _ProfessionStepScreenState extends State<ProfessionStepScreen> {
  String? _selectedProfession;
  String? _selectedIndustry;

  final List<String> _professions = [
    '学生',
    '教师',
    '医生',
    '工程师',
    '设计师',
    '销售',
    '运营',
    '市场',
    '产品经理',
    '程序员',
    '律师',
    '会计师',
    '金融',
    '咨询师',
    '创业者',
    '自由职业',
    '其他',
  ];

  final List<String> _industries = [
    '互联网',
    '金融',
    '教育',
    '医疗',
    '制造业',
    '房地产',
    '零售',
    '媒体',
    '咨询',
    '法律',
    '艺术',
    '体育',
    '旅游',
    '政府',
    '非营利组织',
    '其他',
  ];

  @override
  void initState() {
    super.initState();
    _selectedProfession = widget.userProfile.profession;
    _selectedIndustry = widget.userProfile.industry;
  }

  void _selectProfession(String profession) {
    setState(() {
      _selectedProfession = profession;
      widget.userProfile.profession = profession;
    });
  }

  void _selectIndustry(String industry) {
    setState(() {
      _selectedIndustry = industry;
      widget.userProfile.industry = industry;
    });
  }

  bool get canContinue => _selectedProfession != null;

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
                '你的职业是什么？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择你的职业和所在行业（可选填）',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 职业和行业选择
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 职业选择
                      Text(
                        '职业',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            _professions.map((profession) {
                              final isSelected =
                                  _selectedProfession == profession;
                              return GestureDetector(
                                onTap: () => _selectProfession(profession),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
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
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    profession,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.w600
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),

                      SizedBox(height: 24),

                      // 行业选择
                      Text(
                        '行业 (可选)',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            _industries.map((industry) {
                              final isSelected = _selectedIndustry == industry;
                              return GestureDetector(
                                onTap: () => _selectIndustry(industry),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.orange.shade500
                                            : Colors.white,
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? Colors.orange.shade500
                                              : Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    industry,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color:
                                          isSelected
                                              ? Colors.white
                                              : Colors.black,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.w600
                                              : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),

                      SizedBox(height: 16),

                      // 选择提示
                      if (_selectedProfession != null)
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
                            '职业: $_selectedProfession${_selectedIndustry != null ? ' | 行业: $_selectedIndustry' : ''}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
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
