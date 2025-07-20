import 'dart:async';
import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/widgets/filter/dating_filter.dart';
import 'package:blur/features/match/data/models/match_message_model.dart';
import 'package:blur/features/match/presentation/widgets/message_bubble/message_bubble_card.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
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

    // 加载模拟数据
    _loadMockMessages();
  }

  @override
  void dispose() {
    // _focusNode.dispose();
    hintTimer.cancel();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMockMessages() {
    setState(() {
      _messages = List.from(mockMessages);
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
      final aiMessage = MatchMessageModel(
        content: _generateAIResponse(userMessage),
        direction: MessageDirection.received,
        senderType: SenderType.ai,
        timestamp: DateTime.now(),
        aiThinking: '正在深度分析您的需求...\n考虑您的偏好和当前情况，为您匹配最合适的选项...',
        datingModels: _generateDatingModels(userMessage),
      );

      setState(() {
        _messages.add(aiMessage);
      });

      // 添加AI消息动画
      _listKey.currentState?.insertItem(
        0,
        duration: Duration(milliseconds: 300),
      );
      // _scrollToBottom();
    });
  }

  String _generateAIResponse(String userMessage) {
    if (userMessage.contains('咖啡') || userMessage.contains('coffee')) {
      return '根据您的需求，我为您推荐了几位喜欢咖啡文化的匹配对象：';
    } else if (userMessage.contains('电影') || userMessage.contains('看')) {
      return '为您推荐几位喜欢观影的约会对象：';
    } else if (userMessage.contains('运动') || userMessage.contains('健身')) {
      return '为您推荐了热爱运动的约会伙伴：';
    } else if (userMessage.contains('音乐')) {
      return '为您推荐几位音乐爱好者：';
    } else if (userMessage.contains('艺术') || userMessage.contains('摄影')) {
      return '为您推荐有艺术气质的约会对象：';
    } else {
      return '抱歉，信息不足，请提供更多详细信息来为您匹配合适的约会对象';
    }
  }

  List<DatingModel> _generateDatingModels(String userMessage) {
    // 根据用户消息内容返回相应的约会推荐
    if (userMessage.contains('咖啡') || userMessage.contains('coffee')) {
      return datings.where((d) => d.theme.contains('咖啡')).toList();
    } else if (userMessage.contains('电影')) {
      return datings.where((d) => d.theme.contains('观影')).toList();
    } else if (userMessage.contains('运动') || userMessage.contains('健身')) {
      return datings
          .where(
            (d) => d.theme.contains('Walk') || d.personalityType.contains('运动'),
          )
          .toList();
    } else if (userMessage.contains('音乐')) {
      return datings
          .where(
            (d) => d.theme.contains('音乐') || d.venueName.contains('livehouse'),
          )
          .toList();
    } else if (userMessage.contains('艺术') || userMessage.contains('摄影')) {
      return datings
          .where((d) => d.theme.contains('艺术') || d.venueName.contains('798'))
          .toList();
    }
    return [];
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0, // 因为使用reverse，顶部是0
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // void _onDatingCardTap() {
  //   // TODO: 处理约会卡片点击事件
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text('点击了约会卡片')));
  // }

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
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: hintTexts[currentHintIndex],
                        prefixIcon: HugeIcon(
                          icon: HugeIcons.strokeRoundedAiBrain03,
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
                      backgroundColor: theme.primaryColor.withAlpha(
                        (0.1 * 255).toInt(),
                      ),
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
