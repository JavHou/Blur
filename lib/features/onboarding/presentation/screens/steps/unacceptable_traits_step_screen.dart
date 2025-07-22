import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class UnacceptableTraitsStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const UnacceptableTraitsStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<UnacceptableTraitsStepScreen> createState() =>
      _UnacceptableTraitsStepScreenState();
}

class _UnacceptableTraitsStepScreenState
    extends State<UnacceptableTraitsStepScreen> {
  List<String> _selectedTraits = [];
  late TextEditingController _textController;

  final List<String> _traits = [
    '抽烟',
    '酗酒',
    '冷暴力',
    '不爱护小动物',
    '不讲卫生',
    '说脏话',
    '撒谎',
    '不守时',
    '自私',
    '暴脾气',
    '不孝顺',
    '花心',
  ];

  @override
  void initState() {
    super.initState();
    _selectedTraits = List.from(widget.userProfile.unacceptableTraits ?? []);
    _textController = TextEditingController(
      text: widget.userProfile.unacceptableTraitsText ?? '',
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
    widget.userProfile.unacceptableTraitsText = _textController.text;
  }

  void _toggleTrait(String trait) {
    setState(() {
      if (_selectedTraits.contains(trait)) {
        _selectedTraits.remove(trait);
      } else {
        _selectedTraits.add(trait);
      }
      widget.userProfile.unacceptableTraits = _selectedTraits;
    });
  }

  bool get canContinue => _selectedTraits.isNotEmpty;

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
                '你不能接受的点？(可选)',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请选择你不能接受的伴侣特质，可以多选',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 特质选项
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 标签选择
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            _traits.map((trait) {
                              final isSelected = _selectedTraits.contains(
                                trait,
                              );
                              return GestureDetector(
                                onTap: () => _toggleTrait(trait),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.red.shade500
                                            : Colors.white,
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? Colors.red.shade500
                                              : Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    trait,
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
                          hintText: '你还有什么不能接受的点？',
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
                          '已选择 ${_selectedTraits.length} 个不能接受的点',
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
