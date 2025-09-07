import 'package:blur/shared/border/item_border.dart';
import 'package:flutter/material.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class DatingFAQCard extends StatefulWidget {
  const DatingFAQCard({super.key});

  @override
  State<DatingFAQCard> createState() => _DatingFAQCardState();
}

class _DatingFAQCardState extends State<DatingFAQCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 8),
              Container(
                // Ensure the container fills the row
                width: double.infinity,
                margin: EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.faqDatingSafetyQuestion, // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      context.l10n.faqDatingSafetyAnswer,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    ItemBorder(12),
                    Text(
                      context.l10n.faqEmergencyQuestion, // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      context.l10n.faqEmergencyAnswer,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    ItemBorder(12),

                    Text(
                      context.l10n.faqDepositRefundQuestion, // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      context.l10n.faqDepositRefundAnswer,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
