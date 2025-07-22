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
    '今天有什么约会的好点子？',
    '想跟甜酷辣妹去Coffee Date？',
    '想跟搞笑男去Watch the Show？',
    '想跟运动女孩去City Walk？',
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
        content: '✨ 匹配完成！已为您找到如下的高契合度的理想对象',
        direction: MessageDirection.received,
        senderType: SenderType.ai,
        timestamp: DateTime.now(),
        aiThinking:
            '🧠 AI智能分析中...\n\n🔍 正在深度解读您的需求偏好\n📊 分析您的客观条件：年龄、职业、地理位置、兴趣爱好\n💭 理解您的主观期待：性格匹配度、价值观契合度、生活方式相似性\n🎯 在10万+用户数据库中进行多维度筛选\n⚡ 运行深度学习匹配算法，计算兼容性指数\n🎨 结合您的审美偏好和约会场景需求\n💝 为您量身定制个性化推荐方案',
        // datingModels: _generateDatingModels(userMessage),
        datingModels: [datings[0], datings[1]],
      );
      if (userMessage.contains('日记') || userMessage.contains('吐槽')) {
        aiMessage = MatchMessageModel(
          content: '好呀！今天跟兔兔的约会怎么样？有什么好玩或者吐槽的事情跟我分享吗？我会帮你自动润色成日记哦！',
          direction: MessageDirection.received,
          senderType: SenderType.ai,
          timestamp: DateTime.now().subtract(Duration(minutes: 1)),
        );
      }
      if (userMessage.contains('抓娃娃')) {
        aiMessage = MatchMessageModel(
          content:
              'Dating日记｜第一次约会，我们在娃娃机前杠上了她约我见面，说想去个“压力小一点的地方”。结果目的地是商场负一楼的一整排娃娃机。“你擅长这个？”我问。“不会，但我觉得有意思。”她说。结果从第一台机子开始，她就陷入沉思——不是在想怎么抓，是在研究力学结构和夹爪角度。我站在旁边，看着她一脸认真地投了五十块，娃娃纹丝不动，倒是她频频回头看我表情。“你来吧。”她把位置让出来。于是，我开始教学。从“先晃晃看有没有动的”“要卡边”“下爪前拉一下角度”到“下去前提前放手”。她一边听一边点头，看起来比我当年辅导表弟写作业还认真。我们站在那里整整二十分钟，围了一圈路过的小朋友。我一边讲解，她一边操作，终于夹起一个毛茸茸的小熊，在半空中缓慢移动。我们两个像屏住呼吸一样盯着它——结果快落下那一瞬，一个五六岁的小孩扑上来，一把从出口拿走了娃娃。我当场愣住。她反应比我快，笑着弯腰对小孩说：“这个是姐姐夹的哦。”小孩的妈妈在旁边摆摆手，说：“哎呀小朋友嘛。”她看了我一眼，笑了笑，没说什么，只是重新又换了一张卡，说：“再来一个。”那一刻我突然有点破防。不是因为娃娃，而是她没急，也没演温柔——就是一副“走吧，再来一次”的笃定。最后我们什么都没带走，只在娃娃机旁拍了张合影。我穿着印着爆改kitty图案的白T恤，她T恤胸口写着“Anti Social Social Club”。两个人笑得像刚完成一场荒唐但不无意义的通关任务。我想，大概这就是我喜欢dating的理由——不是因为谁带我去哪儿，而是我们曾在某个没人注意的角落里，一起为了一只三十块的玩具，毫无保留地认真过一次。',
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
