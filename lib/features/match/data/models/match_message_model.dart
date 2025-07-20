import 'package:blur/features/dating/data/models/dating_model.dart';

enum MessageDirection {
  sent, // 发送
  received, // 接收
}

enum SenderType {
  human, // 人类
  ai, // AI
}

class MatchMessageModel {
  final String content;
  final MessageDirection direction;
  final SenderType senderType;
  final DateTime timestamp;
  final String? aiThinking;
  final List<DatingModel>? datingModels;

  MatchMessageModel({
    required this.content,
    required this.direction,
    required this.senderType,
    required this.timestamp,
    this.aiThinking,
    this.datingModels,
  });

  factory MatchMessageModel.fromJson(Map<String, dynamic> json) {
    return MatchMessageModel(
      content: json['content'],
      direction: MessageDirection.values[json['direction']],
      senderType: SenderType.values[json['senderType']],
      timestamp: DateTime.parse(json['timestamp']),
      aiThinking: json['aiThinking'],
      datingModels:
          json['datingModels'] != null
              ? (json['datingModels'] as List)
                  .map((e) => DatingModel.fromJson(e))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'direction': direction.index,
      'senderType': senderType.index,
      'timestamp': timestamp.toIso8601String(),
      'aiThinking': aiThinking,
      'datingModels': datingModels?.map((e) => e.toJson()).toList(),
    };
  }
}

// 模拟消息数据
List<MatchMessageModel> mockMessages = [
  MatchMessageModel(
    content: '我想找个有趣的人一起喝咖啡',
    direction: MessageDirection.sent,
    senderType: SenderType.human,
    timestamp: DateTime.now().subtract(Duration(minutes: 10)),
  ),
  MatchMessageModel(
    content: '根据您的需求，我为您推荐了几位喜欢咖啡文化的匹配对象，他们都有着不同的个性和兴趣爱好，相信能给您带来愉快的约会体验。',
    direction: MessageDirection.received,
    senderType: SenderType.ai,
    timestamp: DateTime.now().subtract(Duration(minutes: 9)),
    aiThinking: '正在分析您的偏好...\n匹配咖啡约会场景...\n考虑性格互补和共同话题...\n为您推荐最合适的约会对象...',
    datingModels: [datings[3], datings[7]],
  ),
  // MatchMessageModel(
  //   content: '有没有适合看电影的约会推荐？',
  //   direction: MessageDirection.sent,
  //   senderType: SenderType.human,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 5)),
  // ),
  // MatchMessageModel(
  //   content: '为您推荐几位喜欢观影的约会对象，都是有趣且健谈的人，相信能给您带来愉快的观影体验。',
  //   direction: MessageDirection.received,
  //   senderType: SenderType.ai,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 4)),
  //   aiThinking: '分析观影偏好...\n匹配幽默感和兴趣爱好...\n考虑约会氛围和话题...',
  //   datingModels: [datings[4]],
  // ),
  // MatchMessageModel(
  //   content: '想找个人一起运动健身',
  //   direction: MessageDirection.sent,
  //   senderType: SenderType.human,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 2)),
  // ),
  // MatchMessageModel(
  //   content: '为您推荐了热爱运动的约会伙伴，她们都有着积极向上的生活态度，相信能激发您的运动热情。',
  //   direction: MessageDirection.received,
  //   senderType: SenderType.ai,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 1)),
  //   aiThinking: '匹配运动偏好...\n考虑健康生活方式...\n分析运动类型和强度...',
  //   datingModels: [datings[3]],
  // ),
];
