import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/tooltip/tooltip_box.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';

class DatingFilter extends StatefulWidget {
  const DatingFilter({super.key});

  @override
  State<DatingFilter> createState() => _DatingFilterState();
}

class _DatingFilterState extends State<DatingFilter> {
  double _minDistance = 1;
  double _maxDistance = 10;

  final List<Map<String, dynamic>> _freeTypes = [
    {
      "title": '所有',
      "icon": HugeIcons.bulkRoundedCalendar03,
      "isSelected": true,
    },
    {"title": '今天', "icon": HugeIcons.bulkRoundedZap, "isSelected": false},
    {
      "title": '周末',
      "icon": HugeIcons.bulkRoundedCalendarLove02,
      "isSelected": false,
    },
    {
      "title": '一周内',
      "icon": HugeIcons.bulkRoundedCalendarSetting02,
      "isSelected": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('过滤器', style: theme.textTheme.labelLarge),
        leadingWidth: 90,
        leading: CupertinoButton(
          child: Text("Close", style: theme.textTheme.labelLarge),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('距离范围', style: theme.textTheme.labelMedium),
            SizedBox(height: 8),
            FlutterSlider(
              values: [_minDistance, _maxDistance],
              rangeSlider: true,
              max: 30,
              min: 1,
              tooltip: FlutterSliderTooltip(
                leftSuffix: Text(' KM'),
                rightSuffix: Text(' KM'),
                boxStyle: FlutterSliderTooltipBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              // 设置轨道样式
              trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(
                  color: Color(0xFFAB3FFF),
                  borderRadius: BorderRadius.circular(2),
                ),
                inactiveTrackBar: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              onDragging: (handlerIndex, lowerValue, upperValue) {
                _minDistance = lowerValue;
                _maxDistance = upperValue;
                setState(() {});
              },
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BaseInput(
                    label: '最小距离 (KM)',
                    hint: '1 KM',
                    value: _minDistance.toString(),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: BaseInput(
                    label: '最大距离 (KM)',
                    hint: ' 10 KM',
                    value: _maxDistance.toString(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('空闲时间', style: theme.textTheme.labelMedium),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var propertyType in _freeTypes)
                  SelectableCategoryCard(
                    title: propertyType['title'],
                    icon: propertyType['icon'],
                    isSelected: propertyType['isSelected'],
                    onTap: () {
                      setState(() {
                        // First deselect all items
                        for (var item in _freeTypes) {
                          item['isSelected'] = false;
                        }
                        // Then select the clicked item
                        propertyType['isSelected'] = true;
                      });
                    },
                  ),
              ],
            ),
            SizedBox(height: 24),
            // Text('Features', style: theme.textTheme.labelMedium),
            // SizedBox(height: 8),
            // Wrap(
            //   spacing: 8,
            //   runSpacing: 8,
            //   children: [
            //     for (var feature in _features)
            //       SelectableCategoryCard(
            //         title: feature['title'],
            //         icon: feature['icon'],
            //         isSelected: feature['isSelected'],
            //         onTap: () {
            //           setState(() {
            //             feature['isSelected'] = !feature['isSelected'];
            //           });
            //         },
            //       ),
            //   ],
            // ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FullWidthButton(
                    isSecondary: true,
                    text: "Reset",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: FullWidthButton(
                    text: "Apply Filters",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
