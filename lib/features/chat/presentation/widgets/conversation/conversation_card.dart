import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/features/chat/data/models/conversation_model.dart';

class ConversationCard extends StatefulWidget {
  final ConversationModel conversation;
  const ConversationCard({super.key, required this.conversation});

  @override
  State<ConversationCard> createState() => _ConversationCardState();
}

class _ConversationCardState extends State<ConversationCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: () {
        context.push('/chats/${widget.conversation.id}/view', extra: widget.conversation);
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        radius: 26,
        backgroundImage: NetworkImage(widget.conversation.avatar),
      ),
      title: Text(widget.conversation.name, style: theme.textTheme.labelLarge),
      subtitle: Text(widget.conversation.lastMessage, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(widget.conversation.lastMessageTime, style: theme.textTheme.bodySmall?.copyWith(color: Colors.blueGrey.shade500)),
          SizedBox(height: 4),
          widget.conversation.unreadMessages == 0 ? SizedBox() :
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.green,
            child: Text(widget.conversation.unreadMessages.toString(), style: theme.textTheme.labelMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
