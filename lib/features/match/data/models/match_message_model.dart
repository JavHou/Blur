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
    content: 'Want to check today\'s matches? Or can you share some good date ideas with me? ~',
    direction: MessageDirection.received,
    senderType: SenderType.ai,
    timestamp: DateTime.now().subtract(Duration(minutes: 9)),
  ),
  
];
