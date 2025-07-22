import 'package:flutter/material.dart';

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
              ' Premium 计划',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '1. 充值30积分/月\n2. 专属客服支持',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: const Text('管理订阅'),
            ),
            const SizedBox(height: 16),
            Divider(color: Colors.grey.shade300),
            Text(
              'Supreme 计划',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '1. 充值100积分/月\n2. VIP客服支持\n3. 重新匹配已拒绝的配对',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: const Text('管理订阅'),
            ),
          ],
        ),
      ),
    );
  }
}
