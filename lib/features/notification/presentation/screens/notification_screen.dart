import 'package:flutter/material.dart';
import 'package:blur/features/notification/presentation/widgets/state/notifications_empty_state.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: theme.textTheme.labelLarge),
      ),
      body: NotificationsEmptyState(),
    );
  }
}
