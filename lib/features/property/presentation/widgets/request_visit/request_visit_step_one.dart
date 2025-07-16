import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/property/presentation/widgets/request_visit/type/visit_type_card.dart';
import 'package:blur/shared/datepicker/adaptive_date_picker.dart';

class RequestVisitStepOne extends StatefulWidget {
  const RequestVisitStepOne({super.key});

  @override
  State<RequestVisitStepOne> createState() => _RequestVisitStepOneState();
}

class _RequestVisitStepOneState extends State<RequestVisitStepOne> {
  bool _isOnlineSelected = false;
  DateTime _dateTime = DateTime.now();

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
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isOnlineSelected = false;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: VisitTypeCard(
                    isSelected: _isOnlineSelected == false,
                    title: 'In Person',
                    icon: HugeIcons.bulkRoundedHome01,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isOnlineSelected = true;
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: VisitTypeCard(
                    isSelected: _isOnlineSelected,
                    title: 'Virtual Visit',
                    icon: HugeIcons.bulkRoundedVideo01,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Date and Time", style: theme.textTheme.titleMedium),
              SizedBox(height: 8),
              AdaptiveDatePicker(
                initialDate: _dateTime,
                onDatePicked: (selectedDate) {
                  setState(() {
                    _dateTime = selectedDate;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
