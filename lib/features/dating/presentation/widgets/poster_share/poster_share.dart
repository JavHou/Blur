import 'package:animate_do/animate_do.dart';
import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:lottie/lottie.dart';

class DatingPosterShareCard extends StatefulWidget {
  final DatingModel dating;

  const DatingPosterShareCard({super.key, required this.dating});

  @override
  State<DatingPosterShareCard> createState() => _DatingPosterShareCardState();
}

class _DatingPosterShareCardState extends State<DatingPosterShareCard>
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

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32),
          Center(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  constraints: BoxConstraints(minHeight: 200, maxHeight: 200),
                  child: ImageWidget(imageUrl: widget.dating.coverImage),
                ),
                FadeInUp(
                  child: Center(
                    child: Lottie.asset(
                      'assets/animations/lottie/congratulation.json',
                      controller: _controller,
                      width: 400,
                      onLoaded: (composition) {
                        _controller
                          ..duration = composition.duration
                          ..forward();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                FadeInUp(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '您与 ${widget.dating.nickname} 的约会请求已发送!',
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
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // Ensure the container fills the row
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '不会破冰？AI为你准备了约会小贴士', // Add numbering
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: Colors.grey.shade800,
                            ),
                          ),
                          Divider(color: Colors.grey.shade300),
                          SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                widget.dating.dateTips
                                    .asMap()
                                    .entries
                                    .map(
                                      (entry) => Container(
                                        // Ensure the container fills the row
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                          top: entry.key == 0 ? 0 : 4,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${entry.key + 1}. ${entry.value}', // Add numbering
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                    color: Colors.grey.shade800,
                                                  ),
                                            ),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: FullWidthButton(
                radius: 52,
                text: "分享海报到微信",
                onPressed: () {
                  context.go('/home');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
