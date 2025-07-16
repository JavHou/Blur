import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/chat/data/models/conversation_model.dart';
import 'package:blur/features/chat/presentation/widgets/conversation/conversation_card.dart';

class ConversationTab extends StatefulWidget {
  const ConversationTab({super.key});

  @override
  State<ConversationTab> createState() => _ConversationTabState();
}

class _ConversationTabState extends State<ConversationTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search in conversations',
              fillColor: Colors.grey.shade100,
              filled: true,
              prefixIcon: HugeIcon(icon: HugeIcons.bulkRoundedSearch01, color: Colors.blueGrey.shade700, size: 20,),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                  style: theme.textTheme.labelLarge,
                  children: [
                    TextSpan(text: 'Conversations'),
                    TextSpan(
                    text: ' (20)',
                    style: TextStyle(
                      fontSize: (theme.textTheme.labelLarge?.fontSize ?? 16) - 2,
                      color: Colors.blueGrey,
                    ),
                    ),
                  ],
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: HugeIcon(icon: HugeIcons.bulkRoundedFilterHorizontal, color: Colors.blueGrey.shade700, size: 20,),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...conversations.map((conversation) => Column(
                    children: [
                    ConversationCard(
                      conversation: conversation,
                    ),
                    if (conversations.indexOf(conversation) != conversations.length - 1)
                      Divider(indent: 58, height: 4, color: Colors.grey.shade200,),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
