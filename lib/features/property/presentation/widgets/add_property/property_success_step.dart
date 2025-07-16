import 'package:animate_do/animate_do.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:lottie/lottie.dart';

class PropertySuccessStep extends StatefulWidget {
  const PropertySuccessStep({super.key});

  @override
  State<PropertySuccessStep> createState() => _PropertySuccessStepState();
}

class _PropertySuccessStepState extends State<PropertySuccessStep>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInUp(
              child: Center(
                child: Lottie.asset(
                  'assets/animations/lottie/success.json',
                  controller: _controller,
                  width: 200,
                  onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  FadeInUp(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Property Added',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        HugeIcon(
                          icon: HugeIcons.bulkRoundedCheckmarkBadge01,
                          color: Colors.green,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  FadeInUp(
                    delay: const Duration(milliseconds: 100),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.blueGrey.shade700,
                          letterSpacing: 0,
                        ),
                        children: [
                          const TextSpan(
                            text:
                                'We received your property information. We will review it and post it on our platform. ',
                          ),
                          const TextSpan(
                            text: '\nIt may take 1-2 hours.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 100),
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.bulkRoundedUser,
                          color: Colors.blueGrey.shade700,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Host Name",
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: Colors.blueGrey.shade700,
                            letterSpacing: 0,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Mohammed",
                            style: theme.textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    border(12),
                    Row(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.bulkRoundedCalendar03,
                          color: Colors.blueGrey.shade700,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Date Time",
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: Colors.blueGrey.shade700,
                            letterSpacing: 0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "16, April 09:00 AM",
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    border(12),
                    Row(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.bulkRoundedNote03,
                          color: Colors.blueGrey.shade700,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Property Type",
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: Colors.blueGrey.shade700,
                            letterSpacing: 0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Apartment",
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FullWidthButton(
                  radius: 52,
                  color: Colors.black,
                  text: "View Property",
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget border(double spacing) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: Colors.grey.shade300,
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}
