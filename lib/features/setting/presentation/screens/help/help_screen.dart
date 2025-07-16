import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/shared/inputs/base_input.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Help", style: theme.textTheme.labelLarge)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              BaseInput(
                hint: "Search in help center",
                prefixIcon: HugeIcon(
                  icon: HugeIcons.bulkRoundedSearch01,
                  color: Colors.grey.shade800,
                  size: 20,
                ),
              ),
              SizedBox(height: 16),
              ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text(
                  'How do I change my password?',
                  style: theme.textTheme.titleMedium,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'You can change your password by going to the "Profile" tab and selecting the "Change Password" option.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ExpansionTile(
                childrenPadding: EdgeInsets.only(top: 0),
                tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text(
                  'How do I contact support?',
                  style: theme.textTheme.titleMedium,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'You can reach our support team via the "Contact Us" option available in the app.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ExpansionTile(
                // childrenPadding: EdgeInsets.only(top: 0),
                tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text(
                  'How can I update my information?',
                  style: theme.textTheme.titleMedium,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'You can update your personal information in the profile tab',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ExpansionTile(
                childrenPadding: EdgeInsets.only(top: 0),
                tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text(
                  'How do I report an issue?',
                  style: theme.textTheme.titleMedium,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              ExpansionTile(
                childrenPadding: EdgeInsets.only(top: 0),
                tilePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text(
                  'How do I manage notifications?',
                  style: theme.textTheme.titleMedium,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
