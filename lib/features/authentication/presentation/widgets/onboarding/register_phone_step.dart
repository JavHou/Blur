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
                  'Enter phone number',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'We will send you an OTP verification code which will be used to continue the process.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            BaseInput(
              label: "Phone Number",
              hint: "e.g. 708 888 888",
              prefixIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  "🇦🇫 +93",
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
