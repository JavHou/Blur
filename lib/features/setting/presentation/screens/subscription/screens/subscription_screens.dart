import 'package:blur/features/setting/presentation/screens/subscription/widgets/subscription_plan_card.dart';
import 'package:blur/shared/border/item_border.dart';
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
        title: Text('升级您的订阅计划', style: theme.textTheme.labelLarge),
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
              Text('您当前的计划是：免费', style: theme.textTheme.titleLarge),
              SizedBox(height: 32),
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
                                'Tips:', // Add numbering
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.grey.shade800,
                                  fontSize: 12,
                                ),
                              ),
                              // SizedBox(height: 8),
                              ItemBorder(12),
                              Text(
                                '不想付费？', // Add numbering
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.grey.shade800,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 8),

                              Text(
                                '每日签到和完成分享日记任务可获得额外积分，积分可用于兑换匹配特权。',
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
