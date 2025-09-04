import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class ProfessionStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const ProfessionStepScreen({super.key, required this.userProfile});

  @override
  State<ProfessionStepScreen> createState() => _ProfessionStepScreenState();
}

class _ProfessionStepScreenState extends State<ProfessionStepScreen> {
  String? _selectedProfession;
  String? _selectedIndustry;

  List<Map<String, String>> _getLocalizedProfessions() {
    return [
      {'title': context.l10n.student, 'value': '学生'},
      {'title': context.l10n.teacher, 'value': '教师'},
      {'title': context.l10n.doctor, 'value': '医生'},
      {'title': context.l10n.engineer, 'value': '工程师'},
      {'title': context.l10n.designer, 'value': '设计师'},
      {'title': context.l10n.sales, 'value': '销售'},
      {'title': context.l10n.operations, 'value': '运营'},
      {'title': context.l10n.marketing, 'value': '市场'},
      {'title': context.l10n.productManager, 'value': '产品经理'},
      {'title': context.l10n.programmer, 'value': '程序员'},
      {'title': context.l10n.lawyer, 'value': '律师'},
      {'title': context.l10n.accountant, 'value': '会计师'},
      {'title': context.l10n.finance, 'value': '金融'},
      {'title': context.l10n.consultant, 'value': '咨询师'},
      {'title': context.l10n.entrepreneur, 'value': '创业者'},
      {'title': context.l10n.freelancer, 'value': '自由职业'},
      {'title': context.l10n.other, 'value': '其他'},
    ];
  }

  List<Map<String, String>> _getLocalizedIndustries() {
    return [
      {'title': context.l10n.internet, 'value': '互联网'},
      {'title': context.l10n.finance, 'value': '金融'},
      {'title': context.l10n.education, 'value': '教育'},
      {'title': context.l10n.healthcare, 'value': '医疗'},
      {'title': context.l10n.manufacturing, 'value': '制造业'},
      {'title': context.l10n.realEstate, 'value': '房地产'},
      {'title': context.l10n.retail, 'value': '零售'},
      {'title': context.l10n.media, 'value': '媒体'},
      {'title': context.l10n.consultant, 'value': '咨询'},
      {'title': context.l10n.legal, 'value': '法律'},
      {'title': context.l10n.arts, 'value': '艺术'},
      {'title': context.l10n.sports, 'value': '体育'},
      {'title': context.l10n.travel, 'value': '旅游'},
      {'title': context.l10n.government, 'value': '政府'},
      {'title': context.l10n.nonprofit, 'value': '非营利组织'},
      {'title': context.l10n.other, 'value': '其他'},
    ];
  }

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
                context.l10n.whatIsYourProfession,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                context.l10n.professionDescription,
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
                        context.l10n.profession,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            _getLocalizedProfessions().map((profession) {
                              final isSelected =
                                  _selectedProfession == profession['value'];
                              return GestureDetector(
                                onTap:
                                    () =>
                                        _selectProfession(profession['value']!),
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
                                    profession['title']!,
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
                        context.l10n.industryOptional,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            _getLocalizedIndustries().map((industry) {
                              final isSelected =
                                  _selectedIndustry == industry['value'];
                              return GestureDetector(
                                onTap:
                                    () => _selectIndustry(industry['value']!),
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
                                    industry['title']!,
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
                            context.l10n.professionSummary(
                              _selectedProfession!,
                              _selectedIndustry != null
                                  ? ' | ${context.l10n.industry}: $_selectedIndustry'
                                  : '',
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
              ),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
