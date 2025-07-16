import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/setting/presentation/widgets/card/setting_list_tile.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Setting', style: theme.textTheme.labelLarge)),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          SettingListTile(
                            title: 'Personal information',
                            icon: HugeIcons.bulkRoundedUser,
                            isFirst: true,
                            onTap: () {
                              context.push("/setting/personal-information");
                            },
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            height: 0,
                            indent: 40,
                          ),
                          SettingListTile(
                            title: 'Change password',
                            icon: HugeIcons.bulkRoundedLockPassword,
                            onTap: () {
                              context.push("/setting/change-password");
                            },
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            height: 0,
                            indent: 40,
                          ),
                          SettingListTile(
                            title: 'Change email',
                            icon: HugeIcons.bulkRoundedMail02,
                            onTap: () {
                              context.push("/setting/change-email");
                            },
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            height: 0,
                            indent: 40,
                          ),
                          SettingListTile(
                            title: 'Security',
                            icon: HugeIcons.bulkRoundedSecurityLock,
                            onTap: () {
                              context.push("/setting/security");
                            },
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            height: 0,
                            indent: 40,
                          ),
                          SettingListTile(
                            title: 'Device management',
                            icon: HugeIcons.bulkRoundedDeviceAccess,
                            isLast: true,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          SettingListTile(
                            title: 'Notifications',
                            icon: HugeIcons.bulkRoundedNotification01,
                            isFirst: true,
                            onTap: () {
                              context.push("/setting/notification");
                            },
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            height: 0,
                            indent: 40,
                          ),
                          SettingListTile(
                            title: 'Privacy Policy',
                            icon: HugeIcons.bulkRoundedPolicy,
                            onTap: () {},
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            height: 0,
                            indent: 40,
                          ),
                          SettingListTile(
                            title: 'Get Help',
                            icon: HugeIcons.bulkRoundedHelpCircle,
                            onTap: () {
                              context.push("/setting/help");
                            },
                          ),
                          Divider(
                            color: Colors.grey.shade200,
                            height: 0,
                            indent: 40,
                          ),
                          SettingListTile(
                            title: 'About us',
                            icon: HugeIcons.bulkRoundedInformationCircle,
                            isLast: true,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
