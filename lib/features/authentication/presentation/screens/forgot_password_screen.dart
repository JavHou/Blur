import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isEmail = true;
  bool _isLoading = false;

  late Timer _timer = Timer(Duration.zero, () {});
  void requestOTP() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(seconds: 2);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        context.push('/verify/otp');
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
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Enter your email to reset your password",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32),
                BaseInput(label: "Email", hint: "e.g. rto1680@gmail.com"),
                SizedBox(height: 16),
                FullWidthButton(
                  radius: 12,
                  text: "Request OTP",
                  isLoading: _isLoading,
                  onPressed: () {
                    requestOTP();
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
