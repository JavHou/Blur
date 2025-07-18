import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/features/property/presentation/widgets/request_visit/request_visit_step_one.dart';
import 'package:blur/features/property/presentation/widgets/request_visit/request_visit_step_three.dart';
import 'package:blur/features/property/presentation/widgets/request_visit/request_visit_step_two.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class DatingconfirmScreen extends StatefulWidget {
  const DatingconfirmScreen({super.key});

  @override
  State<DatingconfirmScreen> createState() => _DatingconfirmScreenState();
}

class _DatingconfirmScreenState extends State<DatingconfirmScreen> {
  late PageController _pageController;
  int _currentStep = 0;

  bool _isLoading = false;

  late Timer _timer = Timer(Duration.zero, () {});

  void process() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        Navigator.of(context).pop();
        context.push('/property/tour/success');
        timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
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
        title: Text('Request a Visit', style: theme.textTheme.labelLarge),
        leading: BackButton(
          onPressed: () {
            if (_currentStep > 0) {
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
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          RequestVisitStepOne(),
          RequestVisitStepTwo(),
          RequestVisitStepThree(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: FullWidthButton(
            text: _currentStep <= 1 ? 'Continue' : "Confirm Dating",
            isLoading: _isLoading,
            onPressed: () {
              if (_currentStep <= 1) {
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
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
