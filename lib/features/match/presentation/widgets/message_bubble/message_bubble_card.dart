import 'package:blur/features/dating/presentation/widgets/cards/vertical_dating_card.dart';
import 'package:flutter/material.dart';
import '../../../data/models/match_message_model.dart';

class MessageBubbleCard extends StatelessWidget {
  final MatchMessageModel message;
  // final VoidCallback? onDatingCardTap;

  const MessageBubbleCard({
    super.key,
    required this.message,
    // this.onDatingCardTap,
  });

  @override
  Widget build(BuildContext context) {
    if (message.direction == MessageDirection.sent) {
      return _buildSentMessage(context);
    } else {
      return _buildReceivedMessage(context);
    }
  }

  Widget _buildSentMessage(BuildContext context) {
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

  Widget _buildReceivedMessage(BuildContext context) {
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
                  SizedBox(height: 8),
                  // 约会卡片
                  if (message.datingModels != null &&
                      message.datingModels!.isNotEmpty)
                    Column(
                      children:
                          message.datingModels!
                              .asMap()
                              .entries
                              .map(
                                (entry) => Container(
                                  margin: EdgeInsets.only(
                                    top: entry.key == 0 ? 0 : 12,
                                  ),
                                  child: VerticalDatingCard(
                                    dating: entry.value,
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
