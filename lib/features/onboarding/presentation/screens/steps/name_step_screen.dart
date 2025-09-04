import 'package:flutter/material.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class NameStepScreen extends StatefulWidget {
  final UserProfileModel userProfile;

  const NameStepScreen({super.key, required this.userProfile});

  @override
  State<NameStepScreen> createState() => _NameStepScreenState();
}

class _NameStepScreenState extends State<NameStepScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.userProfile.nickname ?? '',
    );
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      widget.userProfile.nickname = _controller.text;
    });
  }

  bool get canContinue => _controller.text.trim().isNotEmpty;

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
              // 标题
              Text(
                context.l10n.whatIsYourName,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),

              // 副标题
              Text(
                context.l10n.nameDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 32),

              // 内容
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      autofocus: true,
                      keyboardType: TextInputType.name,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: context.l10n.enterNameHint,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      context.l10n.nameDisplayNote,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
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
