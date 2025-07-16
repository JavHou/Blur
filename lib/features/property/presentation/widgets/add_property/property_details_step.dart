import 'package:flutter/material.dart';
import 'package:blur/shared/inputs/base_input.dart';

class PropertyDetailsStep extends StatefulWidget {
  const PropertyDetailsStep({super.key});

  @override
  State<PropertyDetailsStep> createState() => _PropertyDetailsStepState();
}

class _PropertyDetailsStepState extends State<PropertyDetailsStep> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text('Property Information', style: theme.textTheme.labelLarge),
            const SizedBox(height: 4),
            Text(
              'Please provide the following information about the property you want to add.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 16),
            BaseInput(label: 'Property Name', hint: 'Enter property name'),
            const SizedBox(height: 16),
            BaseInput(
              label: 'Property Description',
              hint: 'Write a short description of the property',
              maxLines: 2,
              // maxLines: 5,
            ),
            const SizedBox(height: 16),
            BaseInput(
              label: 'Property Address',
              hint: 'Enter property address',
            ),
            const SizedBox(height: 16),
            BaseInput(
              label: 'Property Price',
              hint: 'Enter property price',
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.attach_money, color: Colors.black),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
