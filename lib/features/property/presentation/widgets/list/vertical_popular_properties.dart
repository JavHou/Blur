import 'package:flutter/material.dart';
import 'package:blur/features/property/data/models/property_model.dart';
import 'package:blur/features/property/presentation/widgets/card/vertical_property_card.dart';

class VerticalPopularProperties extends StatefulWidget {
  const VerticalPopularProperties({super.key});

  @override
  State<VerticalPopularProperties> createState() =>
      _VerticalPopularPropertiesState();
}

class _VerticalPopularPropertiesState extends State<VerticalPopularProperties> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...properties.map(
          (property) => Container(
            margin: EdgeInsets.only(bottom: 16),
            child: VerticalPropertyCard(property: property),
          ),
        ),
      ],
    );
  }
}
