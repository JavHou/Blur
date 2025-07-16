import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';

class PropertyTypeStep extends StatefulWidget {
  const PropertyTypeStep({super.key});

  @override
  State<PropertyTypeStep> createState() => _PropertyTypeStepState();
}

class _PropertyTypeStepState extends State<PropertyTypeStep> {
  final List<Map<String, dynamic>> _categories = [
    {"title": 'Apartment', "icon": HugeIcons.bulkRoundedBuilding03},
    {"title": 'House', "icon": HugeIcons.bulkRoundedHouse01},
    {"title": 'Villa', "icon": HugeIcons.bulkRoundedTree01},
    {"title": 'Office', "icon": HugeIcons.bulkRoundedOffice},
    {"title": 'Land', "icon": HugeIcons.bulkRoundedTree01},
    {"title": 'Shop', "icon": HugeIcons.bulkRoundedStore01},
    {"title": 'Warehouse', "icon": HugeIcons.bulkRoundedWarehouse},
    {"title": 'Hotel', "icon": HugeIcons.bulkRoundedHotel01},
    {"title": 'Building', "icon": HugeIcons.bulkRoundedBuilding01},
  ];

  int _selectedCategoryIndex = -1;

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
              'What is your property type?',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _categories.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, i) {
                return SelectableCategoryCard(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  title: _categories[i]['title'],
                  icon: _categories[i]['icon'],
                  isSelected: _selectedCategoryIndex == i,
                  onTap: () {
                    setState(() {
                      _selectedCategoryIndex = i;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
