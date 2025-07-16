import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      "title": 'Apartment',
      "icon": HugeIcons.bulkRoundedBuilding03,
      "isSelected": false,
    },
    {
      "title": 'House',
      "icon": HugeIcons.bulkRoundedHouse01,
      "isSelected": false,
    },
    {
      "title": 'Villa',
      "icon": HugeIcons.bulkRoundedTree01,
      "isSelected": false,
    },
    {
      "title": 'Office',
      "icon": HugeIcons.bulkRoundedOffice,
      "isSelected": false,
    },
    {"title": 'Land', "icon": HugeIcons.bulkRoundedTree01, "isSelected": false},
    {
      "title": 'Shop',
      "icon": HugeIcons.bulkRoundedStore01,
      "isSelected": false,
    },
    {
      "title": 'Warehouse',
      "icon": HugeIcons.bulkRoundedWarehouse,
      "isSelected": false,
    },
    {
      "title": 'Hotel',
      "icon": HugeIcons.bulkRoundedHotel01,
      "isSelected": false,
    },
    {
      "title": 'Building',
      "icon": HugeIcons.bulkRoundedBuilding01,
      "isSelected": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: theme.textTheme.labelLarge),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: SelectableCategoryCard(
                      title: category['title'],
                      icon: category['icon'],
                      isSelected: category['isSelected'],
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      onTap: () {
                        context.push(
                          '/categories/${category['title']}/view',
                          extra: category,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
