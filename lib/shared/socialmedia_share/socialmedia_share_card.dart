import 'package:blur/shared/socialmedia_share/screens/socialmedia_share_success.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SocialmediaShareButton extends StatefulWidget {
  const SocialmediaShareButton({super.key});

  @override
  State<SocialmediaShareButton> createState() => _SocialmediaShareButtonState();
}

class _SocialmediaShareButtonState extends State<SocialmediaShareButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('分享至', style: theme.textTheme.titleMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icons/xiaohongshu.png', // Replace with the path to your local Twitter icon
                  width: 36,
                  height: 36,
                  // color: Colors.grey.shade800,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return SizedBox(
                        height: deviceHeight * 0.5,
                        child: SocialmediaShareSuccessScreen(),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedTwitter,
                  size: 36,
                  color: Colors.grey.shade800,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return SizedBox(
                        height: deviceHeight * 0.5,
                        child: SocialmediaShareSuccessScreen(),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedInstagram,
                  size: 36,
                  color: Colors.grey.shade800,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return SizedBox(
                        height: deviceHeight * 0.5,
                        child: SocialmediaShareSuccessScreen(),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedWechat,
                  color: Colors.grey.shade800,
                  size: 36,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    builder: (context) {
                      return SizedBox(
                        height: deviceHeight * 0.5,
                        child: SocialmediaShareSuccessScreen(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
