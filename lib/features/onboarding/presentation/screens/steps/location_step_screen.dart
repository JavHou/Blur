import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class LocationStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const LocationStepScreen({
    super.key,
    required this.userProfile,
  });

  @override
  State<LocationStepScreen> createState() => _LocationStepScreenState();
}

class _LocationStepScreenState extends State<LocationStepScreen> {
  late TextEditingController _cityController;
  late TextEditingController _regionController;

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController(
      text: widget.userProfile.city ?? '',
    );
    _regionController = TextEditingController(
      text: widget.userProfile.region ?? '',
    );

    _cityController.addListener(_onTextChanged);
    _regionController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _cityController.removeListener(_onTextChanged);
    _regionController.removeListener(_onTextChanged);
    _cityController.dispose();
    _regionController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      widget.userProfile.city = _cityController.text;
      widget.userProfile.region = _regionController.text;
    });
  }

  bool get canContinue =>
      _cityController.text.trim().isNotEmpty &&
      _regionController.text.trim().isNotEmpty;

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
                '你住在哪里？',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                '请输入你的居住城市和区域，这将用于匹配附近的用户',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 位置输入
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: '城市',
                        hintText: '例如：北京',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _regionController,
                      decoration: InputDecoration(
                        labelText: '区域',
                        hintText: '例如：朝阳区',
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '你的位置信息将用于计算与其他用户的距离',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
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
