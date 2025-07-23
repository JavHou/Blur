import 'package:animate_do/animate_do.dart';
import 'package:blur/features/dating/presentation/widgets/faq/faq_card.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:lottie/lottie.dart';
import 'package:blur/features/home/presentation/widgets/tabs/meet_tab.dart';

class DatingCheckinScreen extends StatefulWidget {
  const DatingCheckinScreen({super.key});

  @override
  State<DatingCheckinScreen> createState() => _DatingCheckinScreenState();
}

class _DatingCheckinScreenState extends State<DatingCheckinScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    // Ensure MeetTab refreshes when this success page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MeetTabState.globalRefreshCallback?.call();
    });
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
        title: Text('签到成功', style: theme.textTheme.labelLarge),
        // centerTitle: true,
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
      ),
      bottomNavigationBar: SafeArea(
        child: FadeInUp(
          delay: const Duration(milliseconds: 200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FullWidthButton(
              radius: 52,
              text: "返回主页",
              onPressed: () {
                // // 关闭所有打开的 modal 和对话框
                // Navigator.of(
                //   context,
                //   rootNavigator: true,
                // ).popUntil((route) => route.isFirst);

                // 然后导航到首页
                context.go('/home');
                // Navigator.of(context).popUntil((route) => route.isFirst);

                // Navigator.of(
                //   context,
                //   rootNavigator: true,
                // ).popAndPushNamed('/home');

                // Navigator.of(context).pop();
                // Navigator.of(context).pop();

                // context.go('/home');
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            FadeInUp(
              child: Center(
                child: Lottie.asset(
                  'assets/animations/lottie/success.json',
                  controller: _controller,
                  width: 400,
                  height: 200,
                  onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  FadeInUp(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '享受见面的甜美时光吧',
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
                        // Text(
                        //   '记得提醒对方打卡哦！双方打卡后才能返回押金',
                        //   style: theme.textTheme.titleSmall?.copyWith(
                        //     // fontWeight: FontWeight.w600,
                        //     color: Colors.grey.shade400,
                        //     letterSpacing: 0.5,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            SizedBox(height: 32),
            FadeInUp(
              delay: const Duration(milliseconds: 100),
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DatingFAQCard(),
              ),
            ),

            // FadeInUp(
            //   delay: const Duration(milliseconds: 200),
            //   child: SocialmediaShareButton(),
            // ),
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
