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
