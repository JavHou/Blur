import 'package:flutter/material.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class SecuritySettingScreen extends StatefulWidget {
  const SecuritySettingScreen({super.key});

  @override
  State<SecuritySettingScreen> createState() => _SecuritySettingScreenState();
}

class _SecuritySettingScreenState extends State<SecuritySettingScreen> {
  bool _isTwoFactorAuthEnabled = false;
  bool _isBiometricAuthEnabled = false;
  bool _isPasswordLockEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Security', style: theme.textTheme.labelLarge),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              title: Text(
                "Two Factor Authentication",
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                setState(() {
                  _isTwoFactorAuthEnabled = !_isTwoFactorAuthEnabled;
                });
              },
              trailing: Switch(
                value: _isTwoFactorAuthEnabled,
                onChanged: (value) {
                  setState(() {
                    _isTwoFactorAuthEnabled = !_isTwoFactorAuthEnabled;
                  });
                },
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              title: Text(
                "Biometric Authentication",
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                setState(() {
                  _isBiometricAuthEnabled = !_isBiometricAuthEnabled;
                });
              },
              trailing: Switch(
                value: _isBiometricAuthEnabled,
                onChanged: (value) {
                  setState(() {
                    _isBiometricAuthEnabled = !_isBiometricAuthEnabled;
                  });
                },
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              title: Text("Password Lock", style: theme.textTheme.titleMedium),
              onTap: () {
                setState(() {
                  _isPasswordLockEnabled = !_isPasswordLockEnabled;
                });
              },
              trailing: Switch(
                value: _isPasswordLockEnabled,
                onChanged: (value) {
                  setState(() {
                    _isPasswordLockEnabled = !_isPasswordLockEnabled;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            FullWidthButton(text: "Save", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
