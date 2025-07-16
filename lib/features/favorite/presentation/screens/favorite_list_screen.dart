import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/property/presentation/widgets/list/vertical_popular_properties.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite List', style: theme.textTheme.labelLarge),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: HugeIcon(icon: HugeIcons.bulkRoundedSearch01, color: Colors.black),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedFilter, color: Colors.black),
            onPressed: () {
              // Implement filter functionality
            },
          ),
        ],
      ),
      // body: FavoriteListEmptyState()
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
