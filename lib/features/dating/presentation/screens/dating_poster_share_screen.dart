import 'package:animate_do/animate_do.dart';
import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:blur/shared/socialmedia_share/socialmedia_share_card.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:lottie/lottie.dart';

class DatingPosterShareScreen extends StatefulWidget {
  final DatingModel dating;

  const DatingPosterShareScreen({super.key, required, required this.dating});

  @override
  State<DatingPosterShareScreen> createState() =>
      _DatingPosterShareScreenState();
}

class _DatingPosterShareScreenState extends State<DatingPosterShareScreen>
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
        title: Text('分享', style: theme.textTheme.labelLarge),
        // centerTitle: true,
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    constraints: BoxConstraints(minHeight: 200, maxHeight: 300),
                    child: ImageWidget(imageUrl: widget.dating.photos.last),
                  ),
                  FadeInUp(
                    child: Center(
                      child: Lottie.asset(
                        'assets/animations/lottie/congratulation.json',
                        controller: _controller,
                        width: 600,
                        height: 300,
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
            SizedBox(height: 16),
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: SocialmediaShareButton(),
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
