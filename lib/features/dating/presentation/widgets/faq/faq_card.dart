import 'package:blur/shared/border/item_border.dart';
import 'package:flutter/material.dart';

class DatingFAQThree extends StatefulWidget {
  const DatingFAQThree({super.key});

  @override
  State<DatingFAQThree> createState() => _DatingFAQThreeState();
}

class _DatingFAQThreeState extends State<DatingFAQThree> {
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
          child: Expanded(
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
                        '我的约会安全吗？', // Add numbering
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),

                      Text(
                        '我们非常重视用户的安全。所有约会都需要支付押金，约会完成后全额退款。若未协商一致情况下违约，押金将转给对方作为赔偿。此外，我们提供“一键报警”和“实时位置共享”等安全功能，确保您的安全。',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      ),
                      ItemBorder(12),
                      Text(
                        '约会过程中遇到危险怎么办？', // Add numbering
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: Colors.grey.shade800,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),

                      Text(
                        '使用平台内的 "一键报警" 功能，快速联系警方，拨打平台客服热线寻求帮助， 平台24小时为您的安全保驾护航。',
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
        ),
      ],
    );
  }
}
