import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:video_player/video_player.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late VideoPlayerController _video_controller;
  late Animation<double> _titleOpacity;
  late Animation<Offset> _titlePosition;
  late Animation<double> _descriptionOpacity;
  late Animation<double> _buttonOpacity;
  late Animation<double> _buttonScale;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _video_controller =
        VideoPlayerController.asset('assets/videos/onboarding.mp4')
          ..setLooping(true)
          ..setVolume(0.0) // 静音
          ..initialize().then((_) {
            setState(() {
              _video_controller.play();
            });
          });

    _titleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.8, curve: Curves.easeIn),
      ),
    );

    _titlePosition = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );

    _descriptionOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.53,
          0.8,
          curve: Curves.easeIn,
        ), // Adjusted to fit 800-1200ms
      ),
    );

    _buttonOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.easeIn,
        ), // Adjusted to fit 1200-1500ms
      ),
    );

    _buttonScale = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.elasticOut,
        ), // Adjusted to fit 1200-1500ms
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _video_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: screenHeight,
                width: screenHeight * _video_controller.value.aspectRatio,
                child: VideoPlayer(_video_controller),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: _titlePosition,
                  child: FadeTransition(
                    opacity: _titleOpacity,
                    child: ShaderMask(
                      shaderCallback:
                          (bounds) => LinearGradient(
                            colors: [Color(0xFF7951FF), Color(0xFFEB52FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds),
                      child: Text(
                        "Blur",
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                FadeTransition(
                  opacity: _descriptionOpacity,
                  child: Text(
                    "不是99次滑动，只要一次心动",
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 64,
            left: 32,
            right: 32,
            child: Column(
              children: [
                SizedBox(height: 16),
                FadeTransition(
                  opacity: _buttonOpacity,
                  child: ScaleTransition(
                    scale: _buttonScale,
                    child: Row(
                      children: [
                        Expanded(
                          child: FullWidthButton(
                            text: "Login",
                            onPressed: () {
                              context.push("/login");
                            },
                            radius: 52,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              context.push("/register");
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(52),
                                  side: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                            child: Text(
                              "Register",
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
