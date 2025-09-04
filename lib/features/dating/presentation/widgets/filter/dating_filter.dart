import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/tooltip/tooltip_box.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:blur/shared/datepicker/adaptive_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class DatingFilter extends StatefulWidget {
  const DatingFilter({super.key});

  @override
  State<DatingFilter> createState() => _DatingFilterState();
}

class _DatingFilterState extends State<DatingFilter> {
  double _minDistance = 1;
  double _maxDistance = 10;
  DateTime _dateTime = DateTime.now();

  late TextEditingController _minDistanceController;
  late TextEditingController _maxDistanceController;

  int _selectedFilterIndex = 0; // 0 = all, 1 = weekend

  List<Map<String, dynamic>> _getFreeTypes() => [
    {
      "title": context.l10n.all,
      "icon": HugeIcons.bulkRoundedZap,
      "isSelected": _selectedFilterIndex == 0,
    },
    {
      "title": context.l10n.weekend,
      "icon": HugeIcons.bulkRoundedCalendarLove02,
      "isSelected": _selectedFilterIndex == 1,
    },
  ];

  @override
  void initState() {
    super.initState();
    _minDistanceController = TextEditingController(
      text: _minDistance.toStringAsFixed(0),
    );
    _maxDistanceController = TextEditingController(
      text: _maxDistance.toStringAsFixed(0),
    );
  }

  @override
  void dispose() {
    _minDistanceController.dispose();
    _maxDistanceController.dispose();
    super.dispose();
  }

  void _updateMinDistance(double value) {
    setState(() {
      _minDistance = value;
      _minDistanceController.text = value.toStringAsFixed(0);
    });
  }

  void _updateMaxDistance(double value) {
    setState(() {
      _maxDistance = value;
      _maxDistanceController.text = value.toStringAsFixed(0);
    });
  }

  String _getDateFormat() {
    // 根据当前语言环境返回相应的日期格式
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;

    switch (languageCode) {
      case 'zh':
        return 'yyyy年MM月dd日-HH时';
      case 'en':
        return 'MMM dd, yyyy - HH:mm';
      default:
        return 'MMM dd, yyyy - HH:mm';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.filter, style: theme.textTheme.labelLarge),
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: FullWidthButton(
                  isSecondary: true,
                  text: context.l10n.resetFilter,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: FullWidthButton(
                  text: context.l10n.applyFilter,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                context.l10n.distanceRange,
                style: theme.textTheme.labelMedium,
              ),
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
                  _updateMinDistance(lowerValue);
                  _updateMaxDistance(upperValue);
                },
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _minDistanceController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: context.l10n.minDistance,
                        hintText: context.l10n.minDistanceHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onChanged: (val) {
                        final parsed = double.tryParse(val);
                        if (parsed != null &&
                            parsed >= 1 &&
                            parsed <= _maxDistance) {
                          setState(() {
                            _minDistance = parsed;
                          });
                        }
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _maxDistanceController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      readOnly: true,

                      decoration: InputDecoration(
                        labelText: context.l10n.maxDistance,
                        hintText: context.l10n.maxDistanceHint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onChanged: (val) {
                        final parsed = double.tryParse(val);
                        if (parsed != null &&
                            parsed <= 30 &&
                            parsed >= _minDistance) {
                          setState(() {
                            _maxDistance = parsed;
                          });
                        }
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(context.l10n.freeTime, style: theme.textTheme.labelMedium),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (var propertyType in _getFreeTypes())
                    SelectableCategoryCard(
                      title: propertyType['title'],
                      icon: propertyType['icon'],
                      isSelected: propertyType['isSelected'],
                      onTap: () {
                        setState(() {
                          // Find the index of the selected item
                          final freeTypes = _getFreeTypes();
                          for (int i = 0; i < freeTypes.length; i++) {
                            if (freeTypes[i]['title'] ==
                                propertyType['title']) {
                              _selectedFilterIndex = i;
                              break;
                            }
                          }
                        });
                      },
                    ),
                ],
              ),
              SizedBox(height: 8),
              AdaptiveDatePicker(
                dateFormat: _getDateFormat(),
                initialDate: _dateTime,
                onDatePicked: (selectedDate) {
                  setState(() {
                    _dateTime = selectedDate;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
