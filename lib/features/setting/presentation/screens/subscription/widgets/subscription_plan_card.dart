import 'package:flutter/material.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class SubscriptionPlanCard extends StatefulWidget {
  const SubscriptionPlanCard({super.key});

  @override
  State<SubscriptionPlanCard> createState() => _SubscriptionPlanCardState();
}

class _SubscriptionPlanCardState extends State<SubscriptionPlanCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 添加这行使内容左对齐
          children: [
            const SizedBox(height: 16),
            Text(
              context.l10n.premiumPlan,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.premiumPlanDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text(context.l10n.manageSubscription),
            ),
            const SizedBox(height: 16),
            Divider(color: Colors.grey.shade300),
            Text(
              context.l10n.supremePlan,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.supremePlanDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text(context.l10n.manageSubscription),
            ),
          ],
        ),
      ),
    );
  }
}
