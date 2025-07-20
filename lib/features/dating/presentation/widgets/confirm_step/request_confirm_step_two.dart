import 'package:blur/shared/border/item_border.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                "支付押金",
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
            style: theme.textTheme.headlineSmall?.copyWith(color: Colors.green),
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
                      'FAQ', // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Divider(color: Colors.grey.shade300),
                    SizedBox(height: 8),

                    Text(
                      '为什么要支付押金？', // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    // ItemBorder(12),
                    SizedBox(height: 8),

                    Text(
                      '支付押金是为了保护双方权益。约会完成后自动全额退款，若未协商一致情况下违约，押金将转给对方作为赔偿。',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    ItemBorder(12),
                    Text(
                      '我的押金安全吗？', // Add numbering
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey.shade800,
                        fontSize: 12,
                      ),
                    ),
                    // ItemBorder(12),
                    SizedBox(height: 8),

                    Text(
                      '您的押金完全安全！我们使用业界先进的区块链技术，确保您的资金可查，可追溯。平台无法私自操作您的资金，仅有您本人可以操作。',
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
