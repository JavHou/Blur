import 'package:blur/features/setting/presentation/screens/subscription/widgets/subscription_plan_card.dart';
import 'package:blur/shared/border/item_border.dart';
import 'package:blur/shared/utils/localization_helper.dart';
import 'package:flutter/material.dart';

class SubscriptionScreens extends StatefulWidget {
  const SubscriptionScreens({super.key});

  @override
  State<SubscriptionScreens> createState() => _SubscriptionScreensState();
}

class _SubscriptionScreensState extends State<SubscriptionScreens> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          context.l10n.upgradeSubscriptionPlan,
          style: theme.textTheme.labelLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // 添加这行使文本左对齐
            children: [
              // SizedBox(height: 16),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: SubscriptionPlanCard(),
              ),

              SizedBox(height: 8),
              Text(context.l10n.currentPlan, style: theme.textTheme.titleLarge),
              const SizedBox(height: 16),
              Text(context.l10n.comingSoon, style: theme.textTheme.titleLarge),

              Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 添加这行使内容左对齐
                    children: [
                      Divider(color: Colors.grey.shade300),

                      Text(
                        context.l10n.xionMembershipPlan,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        context.l10n.xionMembershipDescription,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        child: Text(context.l10n.verifyEligibility),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Column(
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
                                context.l10n.tips, // Add numbering
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.grey.shade800,
                                  fontSize: 12,
                                ),
                              ),
                              // SizedBox(height: 8),
                              ItemBorder(12),
                              Text(
                                context.l10n.dontWantToPay, // Add numbering
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.grey.shade800,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 8),

                              Text(
                                context.l10n.dailySignInTip,
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
            ],
          ),
        ),
      ),
    );
  }
}
