import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class RegisterPhoneVerificationStep extends StatefulWidget {
  const RegisterPhoneVerificationStep({super.key});

  @override
  State<RegisterPhoneVerificationStep> createState() =>
      _RegisterPhoneVerificationStepState();
}

class _RegisterPhoneVerificationStepState
    extends State<RegisterPhoneVerificationStep> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '验证码登录',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '请输入刚刚发送到您号码上的6位数验证码',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      height: 42,
                      width: 42,
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
                    "没有收到验证码？",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "重新发送",
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
