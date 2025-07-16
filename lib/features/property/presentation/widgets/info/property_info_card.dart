import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/property/data/models/property_model.dart';

class PropertyInfoCard extends StatelessWidget {
  final PropertyModel property;
  const PropertyInfoCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedBed,
                color: Colors.grey.shade700,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "${property.bedrooms} Bed",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedBathtub01,
                color: Colors.grey.shade700,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "${property.bathrooms} Bath",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedArrowExpand01,
                color: Colors.grey.shade700,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "${property.area} sqft",
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
