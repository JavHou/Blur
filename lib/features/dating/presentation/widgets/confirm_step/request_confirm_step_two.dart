import 'package:blur/shared/border/item_border.dart';
import 'package:blur/shared/utils/localization_helper.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class RequestConfirmStepTwo extends StatefulWidget {
  const RequestConfirmStepTwo({super.key});

  @override
  State<RequestConfirmStepTwo> createState() => _RequestConfirmStepTwoState();
}

class _RequestConfirmStepTwoState extends State<RequestConfirmStepTwo> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  context.l10n.payDeposit,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                HugeIcon(
                  icon: HugeIcons.bulkRoundedNewReleases,
                  color: Colors.green,
                  size: 18,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "¥ ${52.0}",
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.green,
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // Ensure the container fills the row
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.faq, // Add numbering
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Divider(color: Colors.grey.shade300),
                      SizedBox(height: 8),

                      Text(
                        context.l10n.whyPayDeposit, // Add numbering
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      ),
                      // ItemBorder(12),
                      SizedBox(height: 8),

                      Text(
                        context.l10n.depositExplanation,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      ),
                      ItemBorder(12),
                      Text(
                        context.l10n.isMyDepositSafe, // Add numbering
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      ),
                      // ItemBorder(12),
                      SizedBox(height: 8),

                      Text(
                        context.l10n.depositSafetyExplanation,
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
      ),
    );
  }
}
