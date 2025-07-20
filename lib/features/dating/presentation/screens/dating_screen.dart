import 'package:blur/features/dating/presentation/screens/dating_confirm_screen.dart';
import 'package:blur/features/dating/presentation/screens/dating_diary_screen.dart';
import 'package:blur/features/dating/presentation/screens/dating_poster_share_screen.dart';
import 'package:blur/features/dating/presentation/widgets/about/dating_about.dart';
import 'package:blur/features/dating/presentation/widgets/details/dating_details.dart';
import 'package:blur/features/dating/presentation/widgets/diary/diary_card.dart';
import 'package:blur/features/dating/presentation/widgets/faq/faq_card.dart';
import 'package:blur/features/dating/presentation/widgets/features/feature_card.dart';
import 'package:blur/features/dating/presentation/widgets/gallery/dating_gallery.dart';
import 'package:blur/features/dating/presentation/widgets/location/dating_location.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:share_plus/share_plus.dart';

class DatingScreen extends StatefulWidget {
  final DatingModel dating;
  const DatingScreen({super.key, required this.dating});

  @override
  State<DatingScreen> createState() => _DatingScreenState();
}

class _DatingScreenState extends State<DatingScreen> {
  Widget _buildBottomButtons(BuildContext context, ThemeData theme) {
    final deviceHeight = MediaQuery.of(context).size.height;

    switch (widget.dating.status) {
      case DatingStatus.pending:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.grey.shade700),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              onPressed: () {
                // showModalBottomSheet(
                //   context: context,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(24),
                //       topRight: Radius.circular(24),
                //     ),
                //   ),
                //   clipBehavior: Clip.antiAliasWithSaveLayer,
                //   builder: (context) {
                //     return SizedBox(
                //       height: deviceHeight * 0.5,
                //       child: DatingconfirmScreen(dating: widget.dating),
                //     );
                //   },
                // );
              },
              label: Text(
                "我再想想",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 8),
            FilledButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.purple),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
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
                      height: deviceHeight * 0.7,
                      child: DatingconfirmScreen(dating: widget.dating),
                    );
                  },
                );
              },
              label: Text(
                "确认约会",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );

      case DatingStatus.upcoming:
        return FullWidthButton(
          text: "分享",
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
                  height: deviceHeight * 0.7,
                  child: DatingPosterShareScreen(dating: widget.dating),
                );
              },
            );
          },
        );
      case DatingStatus.past:
        return FullWidthButton(
          text: "填写约会日记",
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
                  height: deviceHeight * 0.7,
                  child: DatingDiaryScreen(),
                );
              },
            );
          },
        );

      // case DatingStatus.declined:
      // return FullWidthButton(
      //   text: "分享",
      //   onPressed: () {
      //     Share.shareUri(
      //       Uri.parse('https://example.com/dating/${widget.dating.id}'),
      //     );
      //   },
      // );
      case DatingStatus.canceled:
        return FullWidthButton(
          text: "已取消",
          onPressed: () {},
          color: Colors.grey.shade400,
        );

      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('约会详情', style: theme.textTheme.labelLarge),
        actions: [
          IconButton(
            onPressed: () {
              Share.shareUri(
                Uri.parse('https://example.com/dating/${widget.dating.id}'),
                // subject: 'Check out this dating!',
              );
            },
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedShare05,
              color: Colors.black,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: _buildBottomButtons(context, theme),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                constraints: BoxConstraints(minHeight: 200, maxHeight: 400),
                margin: EdgeInsets.symmetric(horizontal: 16),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: ImageWidget(imageUrl: widget.dating.coverImage),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      '${widget.dating.nickname} 绝对是你最佳的约会对象！',
                      style: theme.textTheme.labelLarge,
                    ),

                    SizedBox(height: 16),
                    DatingAbout(dating: widget.dating),
                    SizedBox(height: 16),
                    DatingDetails(dating: widget.dating),
                    // SizedBox(height: 16),
                    // DatingLocation(),
                    // SizedBox(height: 16),
                    SizedBox(height: 16),
                    Text('相册', style: Theme.of(context).textTheme.labelLarge),
                    DatingGallery(dating: widget.dating),

                    SizedBox(height: 16),
                    Text('此外AI发现了些彼此的共同点', style: theme.textTheme.labelLarge),
                    SizedBox(height: 8),
                    DatingFeatures(
                      features: widget.dating.commonalities,
                      isSelected: true,
                    ),
                    SizedBox(height: 16),
                    Text('以及一些有趣的差异点', style: theme.textTheme.labelLarge),
                    SizedBox(height: 8),
                    DatingFeatures(
                      features: widget.dating.differences,
                      isSelected: false,
                    ),
                    SizedBox(height: 16),
                    // 已完成的显示约会日记模块
                    if (widget.dating.status == DatingStatus.past) ...[
                      Text(
                        '约会日记',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      DatingDiaryCard(),
                      SizedBox(height: 16),
                    ],
                    Text(
                      '常见问题',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    DatingFAQCard(),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
