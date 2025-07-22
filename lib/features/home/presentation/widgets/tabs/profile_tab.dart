import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/setting/presentation/widgets/card/setting_list_tile.dart';
import 'package:blur/shared/image/image_widget.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 32),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.grey.shade200,
                    child: ImageWidget(
                      imageUrl:
                          'https://hips.hearstapps.com/hmg-prod/images/36757835-218188988836086-2521657792918454272-n-1532066478.jpg?crop=1xw:1xh;center,top&resize=980:*',
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text('Javen Hou', style: theme.textTheme.labelLarge),
                SizedBox(height: 2),
                Text(
                  'houjav@gmail.com',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.blueGrey.shade800,
                  ),
                ),
                SizedBox(height: 32),
                // Container(
                //   width: double.infinity,
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Home search", style: theme.textTheme.labelMedium),
                //       SizedBox(height: 8,),
                //       Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(12),
                //           border: Border.all(color: Colors.grey.shade200),
                //         ),
                //         child: Column(
                //           children: [
                //             SettingListTile(
                //               title: 'Recently viewed',
                //               icon: HugeIcons.bulkRoundedEye,
                //               isFirst: true,
                //               onTap: () {
                //                 context.push("/recently-viewed");
                //               },
                //             ),
                //             Divider(color: Colors.grey.shade200, height: 0, indent: 40,),
                //             SettingListTile(
                //               title: 'My favorites',
                //               icon: HugeIcons.bulkRoundedFavourite,
                //               onTap: () {
                //                 context.push("/favorite");
                //               },
                //             ),
                //             Divider(color: Colors.grey.shade200, height: 0, indent: 40,),
                //             SettingListTile(
                //               title: 'Past tours',
                //               icon: HugeIcons.bulkRoundedCalendar03,
                //               isLast: true,
                //               onTap: () {
                //               },
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            SettingListTile(
                              title: '会员订阅',
                              icon: HugeIcons.bulkRoundedListSetting,
                              isFirst: true,
                              onTap: () {
                                context.push("/subscription");
                                // context.push("/property/my/listing");
                              },
                            ),
                            Divider(
                              color: Colors.grey.shade200,
                              height: 0,
                              indent: 40,
                            ),
                            SettingListTile(
                              title: '设置',
                              icon: HugeIcons.bulkRoundedSettings02,
                              isLast: true,
                              onTap: () {
                                context.push("/setting");
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () {
                            context.go("/login");
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.grey.shade100,
                            ),
                            overlayColor: WidgetStatePropertyAll(
                              Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HugeIcon(
                                icon: HugeIcons.bulkRoundedLogout01,
                                color: Colors.red,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Logout",
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: Colors.red,
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
