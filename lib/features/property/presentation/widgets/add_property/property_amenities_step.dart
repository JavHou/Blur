import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';

class PropertyAmenitiesStep extends StatefulWidget {
  const PropertyAmenitiesStep({super.key});

  @override
  State<PropertyAmenitiesStep> createState() => _PropertyAmenitiesStepState();
}

class _PropertyAmenitiesStepState extends State<PropertyAmenitiesStep> {

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
    
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Select Amenities',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
