import 'package:flutter/material.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Personal Information', style: theme.textTheme.labelLarge),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              CircleAvatar(
                radius: 62,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: NetworkImage(
                  "https://mighty.tools/mockmind-api/content/human/96.jpg",
                ),
              ),
              SizedBox(height: 32),
              BaseInput(
                label: 'Full Name',
                hint: 'Mohammad Rahmani',
                value: 'Mohammad Rahmani',
              ),
              SizedBox(height: 12),
              BaseInput(
                label: 'Email',
                hint: 'e.g. rto1680@gmail.com',
                value: 'rto1680@gmail.com',
              ),
              SizedBox(height: 12),
              BaseInput(label: 'Phone Number', hint: 'e.g. +93702345678'),
              SizedBox(height: 12),
              BaseInput(
                label: 'Address',
                hint: 'e.g. Kabul, Afghanistan',
                value: 'Kabul, Afghanistan',
              ),
              SizedBox(height: 24),
              FullWidthButton(text: "Save", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
