import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
                  "OTP Verification",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Please enter the code we just sent to your number",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "(907) 168-1616",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Pinput(
                      length: 4,
                      defaultPinTheme: PinTheme(
                        height: 56,
                        width: 56,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        textStyle: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code? ",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Resend",
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                FullWidthButton(
                  text: "Continue",
                  onPressed: () {
                    context.go('/reset-password');
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
