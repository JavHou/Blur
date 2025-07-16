import 'package:flutter/material.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password', style: theme.textTheme.labelLarge),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              BaseInput(
                label: 'Current Password',
                hint: '********',
                obscureText: true,
              ),
              SizedBox(height: 12),
              BaseInput(
                label: 'New Password',
                hint: '********',
                obscureText: true,
              ),
              SizedBox(height: 12),
              BaseInput(
                label: 'Confirm New Password',
                hint: '********',
                obscureText: true,
              ),
              SizedBox(height: 24),
              FullWidthButton(text: "Save", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
