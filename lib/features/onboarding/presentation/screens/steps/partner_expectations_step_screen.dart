import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class PartnerExpectationsStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const PartnerExpectationsStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<PartnerExpectationsStepScreen> createState() =>
      _PartnerExpectationsStepScreenState();
}

class _PartnerExpectationsStepScreenState
    extends State<PartnerExpectationsStepScreen> {
  List<String> _selectedExpectations = [];
  late TextEditingController _textController;

  final List<String> _expectations = [
    '情绪稳定',
    '有上进心',
    '幽默风趣',
    '能陪伴我成长',
    '爱干净',
    '有责任心',
    '孝顺',
    '有共同话题',
    '身体健康',
    '经济独立',
    '有爱心',
    '诚实守信',
  ];

  @override
  void initState() {
    super.initState();
    _selectedExpectations = List.from(
      widget.userProfile.partnerExpectations ?? [],
    );
    _textController = TextEditingController(
      text: widget.userProfile.partnerExpectationsText ?? '',
    );
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    widget.userProfile.partnerExpectationsText = _textController.text;
  }

  void _toggleExpectation(String expectation) {
    setState(() {
      if (_selectedExpectations.contains(expectation)) {
        _selectedExpectations.remove(expectation);
      } else {
        _selectedExpectations.add(expectation);
      }
      widget.userProfile.partnerExpectations = _selectedExpectations;
    });
  }

  bool get canContinue => _selectedExpectations.isNotEmpty;

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
                '你对伴侣的期望？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择你对伴侣的期望，可以多选',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 期望选项
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 标签选择
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            _expectations.map((expectation) {
                              final isSelected = _selectedExpectations.contains(
                                expectation,
                              );
                              return GestureDetector(
                                onTap: () => _toggleExpectation(expectation),
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
                                    expectation,
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

                      // 补充文本框
                      TextField(
                        controller: _textController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: '补充描述 (可选)',
                          hintText: '你还希望伴侣有什么其他特质？',
                          alignLabelWithHint: true,
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
                          '已选择 ${_selectedExpectations.length} 个期望',
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
