import 'package:flutter/material.dart';
import 'package:blur/shared/inputs/base_input.dart';

class PropertyApartmentTypeInfoStep extends StatefulWidget {
  const PropertyApartmentTypeInfoStep({super.key});

  @override
  State<PropertyApartmentTypeInfoStep> createState() => _PropertyApartmentTypeInfoStepState();
}

class _PropertyApartmentTypeInfoStepState extends State<PropertyApartmentTypeInfoStep> {
  
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
            Text(
              'You selected Apartment, Now tell us more about it!',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add your apartment details to help us find the best match for you.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: BaseInput(
                    label: 'Finished Sq. Ft',
                    hint: '0',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BaseInput(
                    label: 'Lot Size',
                    hint: '0 Sq. Ft',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: BaseInput(
                    label: 'Year Built',
                    hint: '2025',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BaseInput(
                    label: 'Bedrooms',
                    hint: '1',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: BaseInput(
                    label: 'Bathrooms',
                    hint: '1',
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BaseInput(
                    label: 'Garage Size',
                    hint: '0',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BaseInput(
              label: 'Monthly Rent',
              hint: '0 \$',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            BaseInput(
              label: 'Sale Price',
              hint: '0 \$',
              keyboardType: TextInputType.number,
            ),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
