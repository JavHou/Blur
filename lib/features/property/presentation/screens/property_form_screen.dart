import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/features/property/presentation/widgets/add_property/property_amenities_step.dart';
import 'package:blur/features/property/presentation/widgets/add_property/property_apartment_type_info_step.dart';
import 'package:blur/features/property/presentation/widgets/add_property/property_details_step.dart';
import 'package:blur/features/property/presentation/widgets/add_property/property_location_step.dart';
import 'package:blur/features/property/presentation/widgets/add_property/property_type_step.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class PropertyFormScreen extends StatefulWidget {
  const PropertyFormScreen({super.key});

  @override
  State<PropertyFormScreen> createState() => _PropertyFormScreenState();
}

class _PropertyFormScreenState extends State<PropertyFormScreen> {
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
        Navigator.of(context).pop();
        context.push('/property/add/success');
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
        title: Text('Add Property', style: theme.textTheme.labelLarge,),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: FullWidthButton(
            text:  _currentStep < 5 ? 'Continue' : "Post Property", 
            isLoading: _isLoading,
            onPressed: () {
              if (_currentStep < 5) {
                  _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  setState(() {
                    _currentStep = _currentStep+1;
                  });
                } else {
                  process();
                }
            }, 
            color: Colors.black,
          )
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Property Details', style: theme.textTheme.labelMedium),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text('0${_currentStep} / 05', style: theme.textTheme.labelMedium?.copyWith(color: Colors.white)),
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: _currentStep / 5.5,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(16),
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentStep = index+1;
                  });
                },
                children: [
                  PropertyDetailsStep(),
                  PropertyTypeStep(),
                  PropertyApartmentTypeInfoStep(),
                  PropertyAmenitiesStep(),
                  PropertyLocationStep()
                  // PropertyImagesStep(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
