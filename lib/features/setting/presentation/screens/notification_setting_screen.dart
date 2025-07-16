import 'package:flutter/material.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Setting', style: theme.textTheme.labelLarge),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text(
                  "Notifications",
                  style: theme.textTheme.titleMedium,
                ),
                onTap: () {},
                trailing: Switch(value: true, onChanged: (value) {}),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text("Sound", style: theme.textTheme.titleMedium),
                onTap: () {},
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text("Vibrate", style: theme.textTheme.titleMedium),
                onTap: () {},
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text(
                  "Special Offers",
                  style: theme.textTheme.titleMedium,
                ),
                onTap: () {},
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text("Payments", style: theme.textTheme.titleMedium),
                onTap: () {},
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                title: Text("App Updates", style: theme.textTheme.titleMedium),
                onTap: () {},
                trailing: Switch(value: true, onChanged: (value) {}),
              ),
              SizedBox(height: 16),
              FullWidthButton(text: "Save Changes", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
