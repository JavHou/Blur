import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// Message models
class ChatMessage {
  final String content;
  final bool isUser;
  final DateTime timestamp;
  final String? aiThinking;
  final List<MeetCard>? meetCards;

  ChatMessage({
    required this.content,
    required this.isUser,
    required this.timestamp,
    this.aiThinking,
    this.meetCards,
  });
}

class MeetCard {
  final String title;
  final String location;
  final String time;
  final String price;
  final String imageUrl;

  MeetCard({
    required this.title,
    required this.location,
    required this.time,
    required this.price,
    required this.imageUrl,
  });
}

class MatchTab extends StatefulWidget {
  const MatchTab({super.key});

  @override
  State<MatchTab> createState() => _MatchTabState();
}

class _MatchTabState extends State<MatchTab> {
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
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    // 定时器每隔 3 秒切换一次 hintText
    hintTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        currentHintIndex = (currentHintIndex + 1) % hintTexts.length;
      });
    });

    // 添加模拟数据
    _loadMockMessages();
  }

  void _loadMockMessages() {
    _messages.addAll([
      ChatMessage(
        content: '想跟甜酷辣妹去Coffee Date',
        isUser: true,
        timestamp: DateTime.now().subtract(Duration(minutes: 10)),
      ),
      ChatMessage(
        content: '为您推荐几个适合Coffee Date的咖啡厅：',
        isUser: false,
        timestamp: DateTime.now().subtract(Duration(minutes: 9)),
        aiThinking:
            '正在分析您的约会需求...\n考虑到您喜欢甜酷辣妹的风格，我会为您推荐一些氛围轻松、环境时尚的咖啡厅，既能展现您的品味，又能让对方感到舒适...',
        meetCards: [
          MeetCard(
            title: '蓝瓶咖啡 Blue Bottle',
            location: '三里屯太古里',
            time: '今日 14:00-22:00',
            price: '¥50-80/人',
            imageUrl: 'assets/images/coffee1.jpg',
          ),
          MeetCard(
            title: 'Manner Coffee',
            location: '国贸CBD',
            time: '今日 07:00-21:00',
            price: '¥30-50/人',
            imageUrl: 'assets/images/coffee2.jpg',
          ),
        ],
      ),
      ChatMessage(
        content: '想找个适合看电影的地方',
        isUser: true,
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      ),
      ChatMessage(
        content: '抱歉，信息不足，请提供更多详细信息',
        isUser: false,
        timestamp: DateTime.now().subtract(Duration(minutes: 4)),
        aiThinking: '正在分析您的需求...\n您提到想看电影，但没有具体说明您的偏好类型、预算范围、地理位置等关键信息...',
        meetCards: [],
      ),
    ]);
  }

  @override
  void dispose() {
    hintTimer.cancel();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(content: text, isUser: true, timestamp: DateTime.now()),
      );
    });

    _messageController.clear();
    _scrollToBottom();

    // 模拟AI回复
    _simulateAIResponse(text);
  }

  void _simulateAIResponse(String userMessage) {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _messages.add(
          ChatMessage(
            content: _generateAIResponse(userMessage),
            isUser: false,
            timestamp: DateTime.now(),
            aiThinking: '正在深度分析您的需求...\n考虑您的偏好和当前情况，为您匹配最合适的选项...',
            meetCards: _generateMeetCards(userMessage),
          ),
        );
      });
      _scrollToBottom();
    });
  }

  String _generateAIResponse(String userMessage) {
    if (userMessage.contains('咖啡') || userMessage.contains('coffee')) {
      return '为您推荐几个适合Coffee Date的咖啡厅：';
    } else if (userMessage.contains('电影') || userMessage.contains('看')) {
      return '为您推荐几个观影好去处：';
    } else if (userMessage.contains('运动') || userMessage.contains('健身')) {
      return '为您推荐几个运动约会场所：';
    } else {
      return '抱歉，信息不足，请提供更多详细信息';
    }
  }

  List<MeetCard> _generateMeetCards(String userMessage) {
    if (userMessage.contains('咖啡') || userMessage.contains('coffee')) {
      return [
        MeetCard(
          title: '星巴克臻选',
          location: '王府井大街',
          time: '今日 06:00-22:00',
          price: '¥40-70/人',
          imageUrl: 'assets/images/starbucks.jpg',
        ),
      ];
    } else if (userMessage.contains('电影')) {
      return [
        MeetCard(
          title: 'CGV影城',
          location: '朝阳大悦城',
          time: '今日 10:00-24:00',
          price: '¥60-120/人',
          imageUrl: 'assets/images/cinema.jpg',
        ),
      ];
    }
    return [];
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
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
                      : SingleChildScrollView(
                        controller: _scrollController,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          children:
                              _messages
                                  .map(
                                    (message) => _buildMessageBubble(message),
                                  )
                                  .toList(),
                        ),
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
                          icon: HugeIcons.bulkRoundedSearch01,
                          color: Colors.black,
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
                      onSubmitted: (value) => _sendMessage(),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: HugeIcon(
                      icon: HugeIcons.bulkRoundedSent,
                      color: theme.primaryColor,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: theme.primaryColor.withOpacity(0.1),
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

  Widget _buildMessageBubble(ChatMessage message) {
    if (message.isUser) {
      return _buildUserMessage(message);
    } else {
      return _buildAIMessage(message);
    }
  }

  Widget _buildUserMessage(ChatMessage message) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message.content,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAIMessage(ChatMessage message) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AI思考过程
                  if (message.aiThinking != null)
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border(
                          left: BorderSide(color: Colors.grey, width: 3),
                        ),
                      ),
                      child: Text(
                        message.aiThinking!,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  // AI回复内容
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(message.content),
                  ),

                  // 预订卡片
                  if (message.meetCards != null &&
                      message.meetCards!.isNotEmpty)
                    ...message.meetCards!
                        .map((card) => _buildBookingCard(card))
                        .toList()
                  else if (message.meetCards != null &&
                      message.meetCards!.isEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Text(
                        '需要更多信息来为您推荐合适的选项',
                        style: TextStyle(color: Colors.orange.shade700),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard(MeetCard card) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.image, color: Colors.grey),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  card.location,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                Text(
                  card.time,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                Text(
                  card.price,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
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
