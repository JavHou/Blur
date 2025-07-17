import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/features/authentication/presentation/widgets/onboarding/register_account_info_step.dart';
import 'package:blur/features/authentication/presentation/widgets/onboarding/register_phone_step.dart';
import 'package:blur/features/authentication/presentation/widgets/onboarding/register_phone_verification_step.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late PageController _pageController;
  int _currentStep = 1;
  bool _isLoading = false;

  late Timer _timer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void process() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        context.push('/register/success');
        timer.cancel();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Step ${_currentStep.toString()} of 2",
          style: theme.textTheme.labelLarge,
        ),
        leading: BackButton(
          onPressed: () {
            if (_currentStep > 1) {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {
                _currentStep = _currentStep - 1;
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: FullWidthButton(
            text: _currentStep < 2 ? '继续' : "注册",
            isLoading: _isLoading,
            onPressed: () {
              if (_currentStep < 2) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                setState(() {
                  _currentStep = _currentStep + 1;
                });
              } else {
                process();
              }
            },
            // color: Colors.black,
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          RegisterPhoneStep(),
          RegisterPhoneVerificationStep(),
          // RegisterAccountInfoStep(),
        ],
      ),
    );
  }
}
