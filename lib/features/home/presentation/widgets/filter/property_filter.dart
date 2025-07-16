import 'package:another_xlider/another_xlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';

class PropertyFilter extends StatefulWidget {
  const PropertyFilter({super.key});

  @override
  State<PropertyFilter> createState() => _PropertyFilterState();
}

class _PropertyFilterState extends State<PropertyFilter> {
  double _minPrice = 10000;
  double _maxPrice = 240000;

  final List<Map<String,dynamic>> _propertyTypes = [
    {"title": 'All', "icon": HugeIcons.bulkRoundedHome01, "isSelected": true},
    {"title": 'Apartment', "icon": HugeIcons.bulkRoundedBuilding03, "isSelected": false},
    {"title": 'House', "icon": HugeIcons.bulkRoundedHouse01, "isSelected": false},
    {"title": 'Villa', "icon": HugeIcons.bulkRoundedTree01, "isSelected": false},
    {"title": 'Office', "icon": HugeIcons.bulkRoundedOffice, "isSelected": false},
    {"title": 'Land', "icon": HugeIcons.bulkRoundedTree01, "isSelected": false},
    {"title": 'Shop', "icon": HugeIcons.bulkRoundedStore01, "isSelected": false},
    {"title": 'Warehouse', "icon": HugeIcons.bulkRoundedWarehouse, "isSelected": false},
    {"title": 'Hotel', "icon": HugeIcons.bulkRoundedHotel01, "isSelected": false},
    {"title": 'Building', "icon": HugeIcons.bulkRoundedBuilding01, "isSelected": false},
  ];

  final List<Map<String, dynamic>> _features = [
    {"title": 'Swimming Pool', "icon": HugeIcons.bulkRoundedPool, "isSelected": false},
    {"title": 'Wifi', "icon": HugeIcons.bulkRoundedWifi01, "isSelected": false},
    {"title": 'Parking', "icon": HugeIcons.bulkRoundedCarParking01, "isSelected": false},
    {"title": 'Garden', "icon": HugeIcons.bulkRoundedTree01, "isSelected": false},
    {"title": 'Security', "icon": HugeIcons.bulkRoundedSecurity, "isSelected": false},
    {"title": 'Furnished', "icon": HugeIcons.bulkRoundedSofa01, "isSelected": false},
    {"title": 'Fireplace', "icon": HugeIcons.bulkRoundedCampfire, "isSelected": false},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters', style: theme.textTheme.labelLarge,),
        leadingWidth: 90,
        leading: CupertinoButton(
          child: Text("Close", style: theme.textTheme.labelMedium), 
          onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Price Range', style: theme.textTheme.labelMedium),
            SizedBox(height: 8),
            FlutterSlider(
              values: [_minPrice, _maxPrice],
              rangeSlider: true,
              max: 500000,
              min: 1000,
              
              onDragging: (handlerIndex, lowerValue, upperValue) {
                _minPrice = lowerValue;
                _maxPrice = upperValue;
                setState(() {});
              },
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: BaseInput(
                    label: 'Min Price',
                    hint: 'Min Price',
                    value: _minPrice.toString(),
                  )
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: BaseInput(
                    label: 'Max Price',
                    hint: 'Max Price',
                    value: _maxPrice.toString(),
                  )
                )
              ],
            ),
            SizedBox(height: 24),
            Text('Property Type', style: theme.textTheme.labelMedium),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
              for (var propertyType in _propertyTypes)
                SelectableCategoryCard(
                  title: propertyType['title'],
                  icon: propertyType['icon'],
                  isSelected: propertyType['isSelected'],
                  onTap: () {
                    setState(() {
                      propertyType['isSelected'] = !propertyType['isSelected'];
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('Features', style: theme.textTheme.labelMedium),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
              for (var feature in _features)
                SelectableCategoryCard(
                  title: feature['title'],
                  icon: feature['icon'],
                  isSelected: feature['isSelected'],
                  onTap: () {
                    setState(() {
                      feature['isSelected'] = !feature['isSelected'];
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Expanded(
                  child: FullWidthButton(
                    isSecondary: true,
                    text: "Reset", 
                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: FullWidthButton(
                    text: "Apply Filters", 
                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
