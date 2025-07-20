import 'package:animate_do/animate_do.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:lottie/lottie.dart';

class SocialmediaShareSuccessScreen extends StatefulWidget {
  const SocialmediaShareSuccessScreen({super.key});

  @override
  State<SocialmediaShareSuccessScreen> createState() =>
      _SocialmediaShareSuccessScreenState();
}

class _SocialmediaShareSuccessScreenState
    extends State<SocialmediaShareSuccessScreen>
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
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('分享成功', style: theme.textTheme.labelLarge),
        // c
      ),
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
            SizedBox(height: 24),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FullWidthButton(
                  radius: 52,
                  color: Colors.black,
                  text: "返回主页",
                  onPressed: () {
                    context.go('/home');
                  },
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
