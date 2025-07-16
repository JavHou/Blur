import 'package:flutter/material.dart';
import 'package:blur/features/property/presentation/widgets/state/property_listing_empty_state.dart';

class MyPropertyListingScreen extends StatefulWidget {
  const MyPropertyListingScreen({super.key});

  @override
  State<MyPropertyListingScreen> createState() => _MyPropertyListingScreenState();
}

class _MyPropertyListingScreenState extends State<MyPropertyListingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Properties', style: theme.textTheme.labelLarge),
      ),
      body: PropertyListingEmptyState(),
    );
  }
}
