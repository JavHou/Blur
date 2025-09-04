import 'dart:async';
import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/widgets/filter/dating_filter.dart';
import 'package:blur/features/match/data/models/match_message_model.dart';
import 'package:blur/features/match/presentation/widgets/message_bubble/message_bubble_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => MatchScreenState();
}

class MatchScreenState extends State<MatchScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final List<String> hintTexts = [
    'Any good date ideas for today?',
    'Want a coffee date with a sweet-cool girl?',
    'Want to watch a show with a funny guy?',
    'Want to go for a city walk with an active girl?',
  ];

  int currentHintIndex = 0;
  late Timer hintTimer;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // Use static list to persist chat history across tab switches
  static List<MatchMessageModel> _persistentMessages = [];
  List<MatchMessageModel> _messages = [];

  @override
  void initState() {
    super.initState();
    // 定时器每隔 3 秒切换一次 hintText
    hintTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        currentHintIndex = (currentHintIndex + 1) % hintTexts.length;
      });
    });

    // Load persistent chat history instead of mock messages
    _loadChatHistory();
    // // 正确弹出筛选弹窗
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final deviceHeight = MediaQuery.of(context).size.height;

    //   showModalBottomSheet(
    //     context: context,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(24),
    //         topRight: Radius.circular(24),
    //       ),
    //     ),
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     builder: (context) {
    //       return SizedBox(height: deviceHeight * 0.5, child: DatingFilter());
    //     },
    //   );
    // });
  }

  @override
  void dispose() {
    // _focusNode.dispose();
    hintTimer.cancel();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadChatHistory() {
    setState(() {
      // Load from persistent storage, fallback to mock if empty
      if (_persistentMessages.isEmpty) {
        _messages = List.from(mockMessages);
        _persistentMessages = List.from(_messages);
      } else {
        _messages = List.from(_persistentMessages);
      }
    });
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final newMessage = MatchMessageModel(
      content: text,
      direction: MessageDirection.sent,
      senderType: SenderType.human,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(newMessage);
      // Save to persistent storage
      _persistentMessages.add(newMessage);
    });

    // 添加动画
    _listKey.currentState?.insertItem(
      0, // 因为使用 reverse，新消息在索引 0
      duration: Duration(milliseconds: 300),
    );

    _messageController.clear();
    // 延迟滚动，确保动画完成

    // 模拟AI回复
    _simulateAIResponse(text);
  }

  void _simulateAIResponse(String userMessage) {
    Future.delayed(Duration(seconds: 1), () {
      var aiMessage = MatchMessageModel(
        // content: _generateAIResponse(userMessage),
        content:
            "✨ Match complete! We've found the following highly compatible matches for you",
        direction: MessageDirection.received,
        senderType: SenderType.ai,
        timestamp: DateTime.now(),
        aiThinking:
            '🧠 AI analysis in progress...\n\n🔍 Deeply interpreting your preference requirements\n📊 Evaluating objective factors: age, occupation, location, interests\n💭 Understanding your subjective expectations: personality match, value alignment, lifestyle compatibility\n🎯 Running multi-dimensional filtering across a 100k+ user database\n⚡ Executing deep learning matching algorithms to compute compatibility scores\n🎨 Incorporating your aesthetic preferences and date scenario needs\n💝 Crafting a personalized recommendation plan for you',
        // datingModels: _generateDatingModels(userMessage),
        datingModels: [datings[0], datings[1]],
      );
      if (userMessage.contains('diary') || userMessage.contains('吐槽')) {
        aiMessage = MatchMessageModel(
          content:
              "Sure! How was your date with Tutu today? Any fun moments or complaints you'd like to share? I can help polish it into a diary for you!",
          direction: MessageDirection.received,
          senderType: SenderType.ai,
          timestamp: DateTime.now().subtract(Duration(minutes: 1)),
        );
      }
      if (userMessage.contains('claw machine')) {
        aiMessage = MatchMessageModel(
          content:
              "Dating diary | First date. We ended up at a row of claw machines in the mall basement after she suggested a 'low-pressure' place. 'Are you good at this?' I asked. 'Not really, but I think it's fun,' she said. From the first machine she was deep in thought—not about how to grab, but analyzing mechanics and claw angles. She seriously fed in fifty bucks, the plushie didn't budge, and she kept glancing at my face. 'You try,' she said, giving me the spot. I started giving tips: 'Nudge it to see if it moves,' 'aim for the edge,' 'adjust the angle before dropping,' 'release slightly early.' She nodded while listening, more focused than when I tutored my cousin. We stood there for twenty minutes as kids passed by. I explained while she operated; finally she lifted a fluffy bear and it drifted toward the chute. We held our breath—at the last moment a five-year-old dashed up and grabbed it. I froze. She reacted faster, smiling as she crouched to the child: 'This one was grabbed by big sister.' The mother waved it off, 'Kids will be kids.' She looked at me, smiled, and quietly bought another token: 'Try again.' I felt unexpectedly moved—not because of the toy, but because she wasn't flustered or putting on an act; she was simply resolute. In the end we took nothing home, only a photo by the machine. I wore a white tee with a remixed kitty print, she had 'Anti Social Social Club' on hers. We laughed like we'd completed an absurd but meaningful little quest. Maybe that's why I like dating—not where someone takes me, but sharing an earnest moment in an unnoticed corner over a thirty-yuan toy.",
          direction: MessageDirection.received,
          senderType: SenderType.ai,
          timestamp: DateTime.now().subtract(Duration(minutes: 1)),
        );
      }
      setState(() {
        _messages.add(aiMessage);
        // Save AI response to persistent storage
        _persistentMessages.add(aiMessage);
      });

      // 添加AI消息动画
      _listKey.currentState?.insertItem(
        0,
        duration: Duration(milliseconds: 300),
      );

      // Print chat history for debugging
      print('=== Chat History (${_persistentMessages.length} messages) ===');
      for (int i = 0; i < _persistentMessages.length; i++) {
        final msg = _persistentMessages[i];
        print(
          '${i + 1}. [${msg.senderType.name.toUpperCase()}] ${msg.timestamp}',
        );
        print(
          '   ${msg.content.substring(0, msg.content.length > 50 ? 50 : msg.content.length)}${msg.content.length > 50 ? '...' : ''}',
        );
      }
      print('=== End Chat History ===');
    });
  }

  // Add method to clear chat history (useful for testing)
  static void clearChatHistory() {
    _persistentMessages.clear();
  }

  void _navigateToConfirm(DatingModel dating) async {
    print('=== MatchScreen: Navigating to confirm for dating ${dating.id} ===');
    final result = await context.push(
      '/dating/${dating.id}/confirm',
      extra: {
        'dating': dating,
        'onUpdate': (DatingModel updatedDating) {
          print(
            '=== MatchScreen: Received update callback for dating ${updatedDating.id} ===',
          );
          _updateDatingFromMatch(updatedDating);
        },
      },
    );

    // Refresh data if needed
    if (result != null) {
      print('=== MatchScreen: Got result, refreshing match data ===');
      _refreshMatchData();
    }
  }

  void _updateDatingFromMatch(DatingModel updatedDating) {
    // Update the dating model in messages if it exists
    setState(() {
      for (int i = 0; i < _messages.length; i++) {
        if (_messages[i].datingModels != null) {
          final datingIndex = _messages[i].datingModels!.indexWhere(
            (d) => d.id == updatedDating.id,
          );
          if (datingIndex != -1) {
            _messages[i].datingModels![datingIndex] = updatedDating;
            _persistentMessages[i].datingModels![datingIndex] = updatedDating;
          }
        }
      }
    });
  }

  void _refreshMatchData() {
    // Refresh match screen data if needed
    setState(() {
      // Additional refresh logic if required
    });
  }

  // String _generateAIResponse(String userMessage) {
  //   return '✨ 匹配完成！已为您找到如下的高契合度的理想对象';

  //   // if (userMessage.contains('咖啡') || userMessage.contains('coffee')) {
  //   //   return '✨ 匹配完成！已为您找到如下的高契合度的理想对象';
  //   // } else if (userMessage.contains('电影') || userMessage.contains('看')) {
  //   //   return '✨ 匹配完成！已为您找到如下的高契合度的理想对象';
  //   // } else if (userMessage.contains('运动') || userMessage.contains('健身')) {
  //   //   return '✨ 匹配完成！已为您找到如下的高契合度的理想对象';
  //   // } else if (userMessage.contains('音乐')) {
  //   //   return '✨ 匹配完成！已为您找到如下的高契合度的理想对象';
  //   // } else if (userMessage.contains('艺术') || userMessage.contains('摄影')) {
  //   //   return '✨ 匹配完成！已为您找到如下的高契合度的理想对象';
  //   // } else {
  //   //   return '抱歉，信息不足，请提供更多详细信息来为您匹配合适的约会对象';
  //   // }
  // }

  // List<DatingModel> _generateDatingModels(String userMessage) {
  //   // 根据用户消息内容返回相应的约会推荐
  //   return [datings[0], datings[1]];
  //   // if (userMessage.contains('咖啡') || userMessage.contains('coffee')) {
  //   //   return datings.where((d) => d.theme.contains('咖啡')).toList();
  //   // } else if (userMessage.contains('电影')) {
  //   //   return datings.where((d) => d.theme.contains('观影')).toList();
  //   // } else if (userMessage.contains('运动') || userMessage.contains('健身')) {
  //   //   return datings
  //   //       .where(
  //   //         (d) => d.theme.contains('Walk') || d.personalityType.contains('运动'),
  //   //       )
  //   //       .toList();
  //   // } else if (userMessage.contains('音乐')) {
  //   //   return datings
  //   //       .where(
  //   //         (d) => d.theme.contains('音乐') || d.venueName.contains('livehouse'),
  //   //       )
  //   //       .toList();
  //   // } else if (userMessage.contains('艺术') || userMessage.contains('摄影')) {
  //   //   return datings
  //   //       .where((d) => d.theme.contains('艺术') || d.venueName.contains('798'))
  //   //       .toList();
  //   // }
  //   // return [];
  // }

  // void _scrollToBottom() {
  //   Future.delayed(Duration(milliseconds: 100), () {
  //     if (_scrollController.hasClients) {
  //       _scrollController.animateTo(
  //         0, // 因为使用reverse，顶部是0
  //         duration: Duration(milliseconds: 300),
  //         curve: Curves.easeOut,
  //       );
  //     }
  //   });
  // }

  // void _onDatingCardTap() {
  //   // TODO: 处理约会卡片点击事件
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text('点击了约会卡片')));
  // }

  // Make persistent messages accessible from other screens
  static List<MatchMessageModel> get persistentMessages => _persistentMessages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        // 点击空白区域时关闭键盘
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Column(
          children: [
            // 聊天记录区域
            Expanded(
              child:
                  _messages.isEmpty
                      ? Center(
                        child: Text(
                          '开始对话吧',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                      )
                      : AnimatedList(
                        key: _listKey,
                        controller: _scrollController,
                        reverse: true, // 从底部开始显示
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        initialItemCount: _messages.length,
                        itemBuilder: (context, index, animation) {
                          // 因为 reverse=true，需要反转索引
                          final reversedIndex = _messages.length - 1 - index;
                          return SlideTransition(
                            position: animation.drive(
                              Tween(
                                begin: Offset(0, 0.3),
                                end: Offset.zero,
                              ).chain(CurveTween(curve: Curves.easeOut)),
                            ),
                            child: FadeTransition(
                              opacity: animation,
                              child: MessageBubbleCard(
                                message: _messages[reversedIndex],
                              ),
                            ),
                          );
                        },
                      ),
            ),

            // 底部输入区域
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                border: Border(top: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _sendMessage();
                    },
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedAiBrain03,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: hintTexts[currentHintIndex],
                        prefixIcon: HugeIcon(
                          icon: HugeIcons.strokeRoundedVoice,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: HugeIcon(
                            icon: HugeIcons.bulkRoundedFilterHorizontal,
                            color: Colors.black,
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
                                  child: DatingFilter(),
                                );
                              },
                            );
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                        _sendMessage();
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _sendMessage();
                    },
                    icon: HugeIcon(
                      icon: HugeIcons.bulkRoundedSent,
                      color: theme.primaryColor,
                    ),
                    style: IconButton.styleFrom(
                      // backgroundColor: theme.primaryColor.withAlpha(
                      //   (0.1 * 255).toInt(),
                      // ),
                      padding: EdgeInsets.all(12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
