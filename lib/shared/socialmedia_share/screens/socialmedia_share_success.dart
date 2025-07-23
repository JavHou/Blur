import 'package:animate_do/animate_do.dart';
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
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FullWidthButton(
            radius: 52,
            text: "返回主页",
            onPressed: () {
              print('Button pressed - navigating to home');

              // 关闭所有打开的 modal 和对话框
              Navigator.of(
                context,
                rootNavigator: true,
              ).popUntil((route) => route.isFirst);

              print('Button pressed done');
            },
          ),
        ),
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

            FadeInUp(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '感谢分享！活动积分稍后会自动发送到您的积分钱包',
                    style: theme.textTheme.titleMedium?.copyWith(
                      // fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                      letterSpacing: 0.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
