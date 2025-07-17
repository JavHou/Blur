import 'dart:async';

import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/features/onboarding/presentation/widgets/onboarding_progress_bar.dart';
import 'package:blur/features/onboarding/data/models/user_profile_model.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/name_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/gender_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/sexual_orientation_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/age_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/location_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/photos_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/mbti_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/partner_expectations_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/unacceptable_traits_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/profession_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/sleep_schedule_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/hobbies_step_screen.dart';
import 'package:blur/features/onboarding/presentation/screens/steps/dietary_habits_step_screen.dart';

class UserProfileOnboardingScreen extends StatefulWidget {
  const UserProfileOnboardingScreen({super.key});

  @override
  State<UserProfileOnboardingScreen> createState() =>
      _UserProfileOnboardingScreenState();
}

class _UserProfileOnboardingScreenState
    extends State<UserProfileOnboardingScreen> {
  late PageController _pageController;
  int _currentStep = 1;
  bool _isLoading = false;
  late Timer _timer = Timer(Duration.zero, () {});

  final int _totalSteps = 13;

  final UserProfileModel _userProfile = UserProfileModel();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void process() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        context.go('/home');
        timer.cancel();
      });
    });
  }
  // void _nextStep() {
  //   if (_currentStep < _totalSteps - 1) {
  //     setState(() {
  //       _currentStep++;
  //     });
  //     _pageController.nextPage(
  //       duration: Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   } else {
  //     // 完成所有步骤，跳转到首页
  //     context.go('/home');
  //   }
  // }

  // void _previousStep() {
  //   if (_currentStep > 0) {
  //     setState(() {
  //       _currentStep--;
  //     });
  //     _pageController.previousPage(
  //       duration: Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        // automaticallyImplyLeading: false,
        title: Text(
          "Step ${_currentStep.toString()} of ${_totalSteps.toString()}",
          style: theme.textTheme.labelLarge,
        ),
        // title: Column(
        //   children: [
        //     // OnboardingProgressBar(
        //     //   currentStep: _currentStep + 1,
        //     //   totalSteps: _totalSteps,
        //     // ),
        //     SizedBox(height: 8),

        //     Text(
        //       '${_currentStep + 1} / $_totalSteps',
        //       style: theme.textTheme.labelMedium?.copyWith(
        //         color: Colors.grey.shade600,
        //       ),
        //     ),
        //   ],
        // ),
        centerTitle: true,
        leading:
            _currentStep > 1
                ? BackButton(
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
                )
                : null,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: FullWidthButton(
            text: _currentStep < _totalSteps ? 'Continue' : "Finish",
            isLoading: _isLoading,
            onPressed: () {
              if (_currentStep < _totalSteps) {
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
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          NameStepScreen(userProfile: _userProfile),
          GenderStepScreen(userProfile: _userProfile),
          SexualOrientationStepScreen(userProfile: _userProfile),
          AgeStepScreen(userProfile: _userProfile),
          LocationStepScreen(userProfile: _userProfile),
          PhotosStepScreen(userProfile: _userProfile),
          MBTIStepScreen(userProfile: _userProfile),
          PartnerExpectationsStepScreen(userProfile: _userProfile),
          UnacceptableTraitsStepScreen(userProfile: _userProfile),
          ProfessionStepScreen(userProfile: _userProfile),
          SleepScheduleStepScreen(userProfile: _userProfile),
          HobbiesStepScreen(userProfile: _userProfile),
          DietaryHabitsStepScreen(userProfile: _userProfile),
        ],
      ),
    );
  }
}
