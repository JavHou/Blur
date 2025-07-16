import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isEmail = true;
  bool _isLoading = false;

  late Timer _timer = Timer(Duration.zero, () {});
  void process() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(seconds: 2);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        context.go('/login');
        timer.cancel();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create new password",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Please set a new password for your account and ensure it meets the security criteria",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32),
                BaseInput(
                  label: "Password",
                  hint: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 16),
                BaseInput(
                  label: "Re-enter password",
                  hint: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 16),
                FullWidthButton(
                  radius: 12,
                  text: "Reset Password",
                  isLoading: _isLoading,
                  onPressed: () {
                    process();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
