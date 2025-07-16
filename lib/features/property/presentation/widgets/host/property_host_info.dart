import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/shared/image/image_widget.dart';

class PropertyHostInfo extends StatefulWidget {
  const PropertyHostInfo({super.key});

  @override
  State<PropertyHostInfo> createState() => _PropertyHostInfoState();
}

class _PropertyHostInfoState extends State<PropertyHostInfo> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Host for this listing', style: theme.textTheme.labelLarge),
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
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey.shade200,
                      child: ImageWidget(
                        imageUrl:
                            "https://mighty.tools/mockmind-api/content/human/96.jpg",
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Mohammad Rahmani",
                            style: theme.textTheme.labelLarge?.copyWith(
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(width: 8),
                          HugeIcon(
                            icon: HugeIcons.bulkRoundedCheckmarkBadge01,
                            color: theme.primaryColor,
                            size: 24,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "7 years experience",
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              border(12),
              OutlinedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.bulkRoundedMessage01,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Contact Host",
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
