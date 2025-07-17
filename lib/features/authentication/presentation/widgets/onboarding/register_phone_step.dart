import 'package:flutter/material.dart';
import 'package:blur/shared/inputs/base_input.dart';

class RegisterPhoneStep extends StatefulWidget {
  const RegisterPhoneStep({super.key});

  @override
  State<RegisterPhoneStep> createState() => _RegisterPhoneStepState();
}

class _RegisterPhoneStepState extends State<RegisterPhoneStep> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '输入您的手机号码',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '我们将向您发送一个6位数验证码，您可以使用该验证码继续进行操作.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            BaseInput(
              hint: "e.g. 123 4561 7891",
              prefixIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  " 🇨🇳 +86",
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
