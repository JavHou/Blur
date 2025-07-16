import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';
import 'package:blur/features/home/presentation/widgets/filter/property_filter.dart';
import 'package:blur/features/property/presentation/widgets/list/vertical_popular_properties.dart';
import 'package:blur/shared/inputs/base_input.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DiscoverTab extends StatefulWidget {
  const DiscoverTab({super.key});

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab> {
  final List<Map<String,dynamic>> _categories = [
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: BaseInput(
          hint: 'Search for your favorite location',
          prefixIcon: HugeIcon(icon: HugeIcons.bulkRoundedSearch01, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: HugeIcon(icon: HugeIcons.bulkRoundedFilterHorizontal, color: Colors.black),
            onPressed: () {
              showCupertinoModalBottomSheet(
                context: context,
                topRadius: Radius.circular(16),
                builder: (context) {
                  return PropertyFilter();
                },
              );
            },
          ),
          SizedBox(width: 8,)
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            height: 52,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              padding: EdgeInsets.only(left: 16, bottom: 10),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 8),
                  child: SelectableCategoryCard(
                    title: _categories[index]['title'],
                    icon: _categories[index]['icon'],
                    isSelected: _categories[index]['isSelected'],
                    onTap: () {
                      setState(() {
                        _categories.forEach((element) {
                          element['isSelected'] = false;
                        });
                        _categories[index]['isSelected'] = true;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.push('/map');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      '142 Properties View on Map',
                      style: theme.textTheme.titleMedium,
                    )
                  ),
                ),
              ),
              SizedBox(height: 16,),
              VerticalPopularProperties(),
            ],
          ),
        ),
      ),
    );
  }
}
