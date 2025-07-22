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
              ' Flirt 计划',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '1. 免费使用所有基础功能\n2. 活动积分兑换',
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
              ' Spark 计划',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '1. Flirt 计划的所有功能\n2. 每天3次配对机会\n3. 优先客服支持',
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
              'Blaze 计划',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '1. Spark 计划的所有功能\n2. 每天10次配对机会\n3. 专属客服支持\n4. 可以重新匹配已拒绝的配对',
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
