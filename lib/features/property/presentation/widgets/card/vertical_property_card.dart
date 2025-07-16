import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/property/data/models/property_model.dart';
import 'package:blur/features/property/presentation/widgets/info/property_info_card.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:blur/shared/utils/number/number_utils.dart';

class VerticalPropertyCard extends StatefulWidget {
  final PropertyModel property;
  const VerticalPropertyCard({super.key, required this.property});

  @override
  State<VerticalPropertyCard> createState() => _VerticalPropertyCardState();
}

class _VerticalPropertyCardState extends State<VerticalPropertyCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        context.push(
          '/property/${widget.property.id}/view',
          extra: widget.property,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: 200, maxHeight: 300),
                    child: ImageWidget(imageUrl: widget.property.coverImage),
                  ),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        !widget.property.isForRent ? 'For Sale' : 'For Rent',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.property.title,
                        style: theme.textTheme.labelLarge,
                      ),
                      Spacer(),
                      Text(
                        "\$${formatPrice(widget.property.salePrice!)}",
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: Colors.green.shade500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedClock01,
                        color: Colors.grey.shade800,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: Colors.grey.shade800,
                            letterSpacing: 0,
                          ),
                          children: [
                            TextSpan(text: 'Listed 4 hours ago '),
                            TextSpan(
                              text: '(Kabul, Afghanistan)',
                              style: theme.textTheme.labelMedium?.copyWith(
                                fontSize: 16 * 0.8,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  PropertyInfoCard(property: widget.property),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
