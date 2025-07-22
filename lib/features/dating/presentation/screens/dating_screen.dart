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
import 'package:blur/features/match/presentation/widgets/share/share_card.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:blur/features/home/presentation/widgets/tabs/meet_tab.dart';
import 'package:blur/features/match/presentation/screens/match_screen.dart';
import 'package:blur/features/match/data/models/match_message_model.dart';

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
                // Navigator.of(context).pop();
                context.go("/home");
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
          text: "约会打卡",
          onPressed: () {
            // Update dating status to past
            final updatedDating = widget.dating.copyWith(
              status: DatingStatus.past,
            );

            // Update global datings list
            final globalIndex = datings.indexWhere(
              (d) => d.id == updatedDating.id,
            );
            if (globalIndex != -1) {
              datings[globalIndex] = updatedDating;
              print('Updated dating ${updatedDating.id} status to past');
            }

            // Add new message to MatchScreen
            final newMessage = MatchMessageModel(
              content:
                  '今天跟${updatedDating.nickname}的约会怎么样？有什么好玩或者吐槽的事情跟我分享吗？我会帮你自动润色成日记哦！',
              direction: MessageDirection.received,
              senderType: SenderType.ai,
              timestamp: DateTime.now(),
            );

            // Add to MatchScreen's persistent messages
            MatchScreenState.persistentMessages.add(newMessage);
            print('Added new message to MatchScreen: ${newMessage.content}');

            // Notify MeetTab to refresh globally
            if (MeetTabState.globalRefreshCallback != null) {
              print('Calling MeetTabState.globalRefreshCallback for check-in');
              MeetTabState.globalRefreshCallback!();
            } else {
              print(
                'WARNING: MeetTabState.globalRefreshCallback is null during check-in',
              );
            }

            context.go("/dating/${widget.dating.id}/checkin");
          },
        );
      case DatingStatus.past:
        return FullWidthButton(
          text: "分享约会日记",
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
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: MessageShareCard(
                    message:
                        'Dating日记｜第一次约会，我们在娃娃机前杠上了她约我见面，说想去个“压力小一点的地方”。结果目的地是商场负一楼的一整排娃娃机。“你擅长这个？”我问。“不会，但我觉得有意思。”她说。结果从第一台机子开始，她就陷入沉思——不是在想怎么抓，是在研究力学结构和夹爪角度。我站在旁边，看着她一脸认真地投了五十块，娃娃纹丝不动，倒是她频频回头看我表情。“你来吧。”她把位置让出来。于是，我开始教学。从“先晃晃看有没有动的”“要卡边”“下爪前拉一下角度”到“下去前提前放手”。她一边听一边点头，看起来比我当年辅导表弟写作业还认真。我们站在那里整整二十分钟，围了一圈路过的小朋友。我一边讲解，她一边操作，终于夹起一个毛茸茸的小熊，在半空中缓慢移动。我们两个像屏住呼吸一样盯着它——结果快落下那一瞬，一个五六岁的小孩扑上来，一把从出口拿走了娃娃。我当场愣住。她反应比我快，笑着弯腰对小孩说：“这个是姐姐夹的哦。”小孩的妈妈在旁边摆摆手，说：“哎呀小朋友嘛。”她看了我一眼，笑了笑，没说什么，只是重新又换了一张卡，说：“再来一个。”那一刻我突然有点破防。不是因为娃娃，而是她没急，也没演温柔——就是一副“走吧，再来一次”的笃定。最后我们什么都没带走，只在娃娃机旁拍了张合影。我穿着印着爆改kitty图案的白T恤，她T恤胸口写着“Anti Social Social Club”。两个人笑得像刚完成一场荒唐但不无意义的通关任务。我想，大概这就是我喜欢dating的理由——不是因为谁带我去哪儿，而是我们曾在某个没人注意的角落里，一起为了一只三十块的玩具，毫无保留地认真过一次。',
                  ),
                );
              },
            );
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
            //       height: deviceHeight * 0.7,
            //       child: DatingDiaryScreen(),
            //     );
            //   },
            // );
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
                        '您的押金已原路返回',
                        style: theme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      // DatingDiaryCard(),
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
