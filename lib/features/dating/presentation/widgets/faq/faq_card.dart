import 'package:blur/shared/border/item_border.dart';
import 'package:flutter/material.dart';
import 'package:blur/generated/l10n.dart';

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
                      S.of(context).faqDatingSafetyQuestion, // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      S.of(context).faqDatingSafetyAnswer,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    ItemBorder(12),
                    Text(
                      S.of(context).faqEmergencyQuestion, // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      S.of(context).faqEmergencyAnswer,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    ItemBorder(12),

                    Text(
                      S.of(context).faqDepositRefundQuestion, // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      S.of(context).faqDepositRefundAnswer,
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
