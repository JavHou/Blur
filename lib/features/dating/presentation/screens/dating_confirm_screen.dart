import 'dart:async';

import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/widgets/confirm_step/request_confirm_step_one.dart';
import 'package:blur/features/dating/presentation/widgets/confirm_step/request_confirm_step_two.dart';
import 'package:blur/features/home/presentation/widgets/tabs/meet_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class DatingconfirmScreen extends StatefulWidget {
  final DatingModel dating;
  final Function(DatingModel)? onDatingUpdated;
  const DatingconfirmScreen({
    super.key,
    required this.dating,
    this.onDatingUpdated,
  });

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

        // Use copyWith to update the status
        final updatedDating = widget.dating.copyWith(
          status: DatingStatus.upcoming,
        );

        print('=== DatingconfirmScreen: About to update dating ===');
        print('Dating ID: ${updatedDating.id}');
        print('New status: ${updatedDating.status}');

        // Update global datings list first
        final globalIndex = datings.indexWhere((d) => d.id == updatedDating.id);
        if (globalIndex != -1) {
          datings[globalIndex] = updatedDating;
          print('Updated global datings at index $globalIndex');
        } else {
          print('ERROR: Dating not found in global datings list');
        }

        // Call the callback to update parent widget
        widget.onDatingUpdated?.call(updatedDating);
        print('Called parent widget callback');

        // Notify MeetTab to refresh globally
        print(
          'Checking MeetTabState.globalRefreshCallback: ${MeetTabState.globalRefreshCallback != null}',
        );
        if (MeetTabState.globalRefreshCallback != null) {
          print('Calling MeetTabState.globalRefreshCallback');
          try {
            MeetTabState.globalRefreshCallback!();
            print('Successfully called globalRefreshCallback');
          } catch (e) {
            print('Error calling globalRefreshCallback: $e');
          }
        } else {
          print('ERROR: MeetTabState.globalRefreshCallback is null');
          print(
            'This might happen if MeetTab is not currently active or has been disposed',
          );

          // Alternative: Try to refresh via navigation result
          print('Will rely on navigation result to trigger refresh');
        }

        // Pop with result to trigger refresh in calling screen
        Navigator.of(context).pop(updatedDating);

        context.push(
          '/dating/${updatedDating.id}/confirm/success',
          extra: updatedDating,
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
