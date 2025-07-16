import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class PropertyDetails extends StatefulWidget {
  const PropertyDetails({super.key});

  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Details', style: theme.textTheme.labelLarge),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "List Price",
                    style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
        
                    },
                    child: Text(
                      "\$500,000",
                      style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              border(12),
              Row(
                children: [
                  Text(
                    "On Market",
                    style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
        
                    },
                    child: Text(
                      "30 days",
                      style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              border(12),
              Row(
                children: [
                  Text(
                    "Community",
                    style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0),
                  ),
                  Spacer(),
                  Text(
                    "Share-Now",
                    style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              border(12),
              Row(
                children: [
                  Text(
                    "Country",
                    style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0),
                  ),
                  Spacer(),
                  Text(
                    "Afghanistan",
                    style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              border(12),
              Row(
                children: [
                  Text(
                    "Build Year",
                    style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0),
                  ),
                  Spacer(),
                  Text(
                    "1997",
                    style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              border(12),
              Row(
                children: [
                  Text(
                    "Lot Size",
                    style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0),
                  ),
                  Spacer(),
                  Text(
                    "3.400 sqft",
                    style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          )
        ),
      ],
    );
  }

  Widget border(double spacing) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: Colors.grey.shade300,
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}
