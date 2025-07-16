import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ConversationNavbar extends StatelessWidget {
  const ConversationNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return BottomAppBar(
      color: Colors.grey.shade100,
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: HugeIcon(icon: HugeIcons.bulkRoundedAttachment, color: Colors.black),
                  hintText: 'write here',
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue.shade300),
              ),
              onPressed: () {}, 
              icon: HugeIcon(icon: HugeIcons.solidRoundedSent, color: Colors.white, size: 20),
            )
          ],
        ),
      ),
    );
  }
}
