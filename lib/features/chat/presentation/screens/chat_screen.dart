import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/features/chat/data/models/conversation_model.dart';
import 'package:blur/features/chat/presentation/widgets/conversation/conversation_navbar.dart';
import 'package:blur/features/chat/presentation/widgets/message/user_message_card.dart';

class ChatScreen extends StatefulWidget {
  final ConversationModel conversation;
  const ChatScreen({super.key, required this.conversation});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        scrolledUnderElevation: 0,
        title: InkWell(
          onTap: () {
            context.push('/chats/${widget.conversation.id}/info', extra: widget.conversation);
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: NetworkImage(widget.conversation.avatar),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.conversation.name, style: theme.textTheme.labelLarge),
                  Text('Last seen recently', style: theme.textTheme.bodySmall?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: ConversationNavbar(),
      body: SafeArea(
        child: Container(
          height: deviceHeight * 0.8,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 32,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text("Today", style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade900, letterSpacing: 0)),
                    )
                  ],
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  // child: DoctorMessageCard(message: "If you are ready we can call!",),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: UserMessageCard(message: "Yes, please call now",),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: UserMessageCard(message: "Please call sooner my patient can not hold their pain.",),
                ),
                SizedBox(height: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
