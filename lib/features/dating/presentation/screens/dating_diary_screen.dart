import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class DatingDiaryScreen extends StatefulWidget {
  const DatingDiaryScreen({super.key});

  @override
  State<DatingDiaryScreen> createState() => _DatingDiaryScreenState();
}

class _DatingDiaryScreenState extends State<DatingDiaryScreen> {
  final List<Map<String, dynamic>> _freeTypes = [
    {
      "title": '理想型',
      "icon": HugeIcons.bulkRoundedCalendar03,
      "isSelected": true,
    },
    {"title": '一般般', "icon": HugeIcons.bulkRoundedZap, "isSelected": false},
    {
      "title": '不满意',
      "icon": HugeIcons.bulkRoundedCalendarLove02,
      "isSelected": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.datingDiary,
          style: theme.textTheme.labelLarge,
        ),
        leadingWidth: 90,
        leading: CupertinoButton(
          child: Text(context.l10n.close, style: theme.textTheme.labelLarge),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16), // 设置左右间距
          child: FullWidthButton(
            text: context.l10n.submitDiary,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 8),
            // Text('真人与是否符合预期？', style: theme.textTheme.labelMedium),
            // SizedBox(height: 8),
            // Wrap(
            //   spacing: 8,
            //   runSpacing: 8,
            //   children: [
            //     for (var propertyType in _freeTypes)
            //       SelectableCategoryCard(
            //         title: propertyType['title'],
            //         icon: propertyType['icon'],
            //         isSelected: propertyType['isSelected'],
            //         onTap: () {
            //           setState(() {
            //             // First deselect all items
            //             for (var item in _freeTypes) {
            //               item['isSelected'] = false;
            //             }
            //             // Then select the clicked item
            //             propertyType['isSelected'] = true;
            //           });
            //         },
            //       ),
            //   ],
            // ),
            SizedBox(height: 8),
            // Text('提交后后AI会自动美化', style: theme.textTheme.labelMedium),
            SizedBox(height: 8),
            Expanded(
              child: TextField(
                maxLines: 5,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: context.l10n.diaryPlaceholder,
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
