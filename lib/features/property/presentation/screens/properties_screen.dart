import 'package:flutter/material.dart';
import 'package:blur/features/property/presentation/widgets/list/vertical_popular_properties.dart';

class PropertiesScreen extends StatefulWidget {
  const PropertiesScreen({super.key});

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Properties', style: theme.textTheme.labelLarge),
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Show filter options
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: VerticalPopularProperties(),
          ),
        ),
      ),
    );
  }
}
