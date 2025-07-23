import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class DatingFeatures extends StatelessWidget {
  final List<String> features;
  final bool isSelected;

  const DatingFeatures({
    super.key,
    required this.features,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var feature in features)
              SelectableCategoryCard(
                title: feature,
                icon: HugeIcons.twotoneRoundedQuillWrite01,
                // icon: feature['icon'],
                isSelected: isSelected,
                onTap: () {},
              ),
          ],
        ),
      ],
    );
  }
}
