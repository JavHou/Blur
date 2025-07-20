import 'dart:ui' as ui;
import 'package:animate_do/animate_do.dart';
import 'package:blur/shared/socialmedia_share/socialmedia_share_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/rendering.dart';

class MessageShareCard extends StatefulWidget {
  final String message;

  const MessageShareCard({super.key, required this.message});

  @override
  State<MessageShareCard> createState() => _MessageShareCardState();
}

class _MessageShareCardState extends State<MessageShareCard>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  final GlobalKey _textToImageKey =
      GlobalKey(); // Key for capturing text as an image
  ui.Image? _textImage;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _generateTextImage(); // Generate the image on initialization
  }

  Future<void> _generateTextImage() async {
    try {
      final boundary =
          _textToImageKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;
      if (boundary != null) {
        final image = await boundary.toImage(pixelRatio: 3.0);
        setState(() {
          _textImage = image;
        });
      }
    } catch (e) {
      print('Error generating text image: $e');
    }
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
                  constraints: BoxConstraints(minHeight: 200, maxHeight: 300),
                  child:
                      _textImage != null
                          ? RawImage(
                            image: _textImage,
                          ) // Display the generated image
                          : RepaintBoundary(
                            key: _textToImageKey,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  widget.message,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    // fontWeight: FontWeight.bold,
                                    // color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                ),
                FadeInUp(
                  child: Center(
                    child: Lottie.asset(
                      'assets/animations/lottie/congratulation.json',
                      controller: _controller,
                      width: 200,
                      height: 200,
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
          SizedBox(height: 32),

          SizedBox(height: 24),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: SocialmediaShareButton(),
          ),
        ],
      ),
    );
  }
}
