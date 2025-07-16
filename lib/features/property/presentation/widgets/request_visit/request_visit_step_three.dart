import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class RequestVisitStepThree extends StatefulWidget {
  const RequestVisitStepThree({super.key});

  @override
  State<RequestVisitStepThree> createState() => _RequestVisitStepThreeState();
}

class _RequestVisitStepThreeState extends State<RequestVisitStepThree> {
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Review your tour", style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 8,),
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
                  Text("Luxury Villa", style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      HugeIcon(icon: HugeIcons.bulkRoundedLocation01, color: Colors.black, size: 22,),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("6th, Share-Now, Kabul", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey.shade700)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Divider(color: Colors.grey.shade300,),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      HugeIcon(icon: HugeIcons.bulkRoundedCalendar01, color: Colors.black, size: 22,),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("Monday, 12th March - 10:00 AM", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey.shade700)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      HugeIcon(icon: HugeIcons.bulkRoundedUser, color: Colors.black, size: 22,),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("John Doe", style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade800)),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      HugeIcon(icon: HugeIcons.bulkRoundedCall02, color: Colors.black, size: 22,),
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("+93 700 000 000", style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade900)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
