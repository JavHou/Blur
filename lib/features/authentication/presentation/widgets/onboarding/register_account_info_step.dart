import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:blur/shared/inputs/base_input.dart';

class RegisterAccountInfoStep extends StatefulWidget {
  const RegisterAccountInfoStep({super.key});

  @override
  State<RegisterAccountInfoStep> createState() =>
      _RegisterAccountInfoStepState();
}

class _RegisterAccountInfoStepState extends State<RegisterAccountInfoStep> {
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
                  'Create your account',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Complete the form below to create your account',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            BaseInput(label: "First Name", hint: "e.g. Mohammad"),
            SizedBox(height: 16),
            BaseInput(label: "Last Name", hint: "e.g. Rahmani"),
            SizedBox(height: 16),
            BaseInput(label: "Email", hint: "e.g. rto1680@gmail.com"),
            SizedBox(height: 16),
            BaseInput(
              label: "Password",
              hint: "Enter your password",
              obscureText: true,
            ),
            SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
                children: [
                  TextSpan(text: 'By proceeding you agree with the '),
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Terms and Conditions page
                          },
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Privacy Policy page
                          },
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
