import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/property/presentation/widgets/list/vertical_popular_properties.dart';

class RecentlyViewedListScreen extends StatefulWidget {
  const RecentlyViewedListScreen({super.key});

  @override
  State<RecentlyViewedListScreen> createState() =>
      _RecentlyViewedListScreenState();
}

class _RecentlyViewedListScreenState extends State<RecentlyViewedListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Recently Viewed List', style: theme.textTheme.labelLarge),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: HugeIcon(
              icon: HugeIcons.bulkRoundedSearch01,
              color: Colors.black,
            ),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedFilter,
              color: Colors.black,
            ),
            onPressed: () {
              // Implement filter functionality
            },
          ),
        ],
      ),
      // body: RecentlyViewedListEmptyState()
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: VerticalPopularProperties(),
        ),
      ),
    );
  }
}
