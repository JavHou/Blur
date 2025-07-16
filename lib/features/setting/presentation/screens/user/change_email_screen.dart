import 'package:flutter/material.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Email', style: theme.textTheme.labelLarge),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              BaseInput(
                label: 'Email',
                hint: 'e.g. rto1680@gmail.com',
                value: 'rto1680@gmail.com',
              ),
              SizedBox(height: 24),
              FullWidthButton(text: "Request OTP", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
