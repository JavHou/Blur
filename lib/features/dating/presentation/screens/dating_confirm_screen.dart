import 'dart:async';

import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/widgets/confirm_step/request_confirm_step_one.dart';
import 'package:blur/features/dating/presentation/widgets/confirm_step/request_confirm_step_two.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class DatingconfirmScreen extends StatefulWidget {
  final DatingModel dating;
  const DatingconfirmScreen({super.key, required this.dating});

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
        context.push(
          '/dating/${widget.dating.id}/confirm/success',
          extra: widget.dating,
        );

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
        title: Text('确认约会🤩', style: theme.textTheme.labelLarge),
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
          RequestConfirmStepOne(dating: widget.dating),
          RequestConfirmStepTwo(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60,
          child: FullWidthButton(
            text: _currentStep <= 0 ? '继续' : "确认",
            isLoading: _isLoading,
            onPressed: () {
              if (_currentStep <= 0) {
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
    );
  }
}
