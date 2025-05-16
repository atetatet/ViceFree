// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '''
ViceFree - Privacy Policy
Effective Date: May 16, 2025

At ViceFree, your privacy is important to us. This privacy policy explains how we handle your information.

1. We Do Not Collect Personal Data
ViceFree does not collect, store, or share any personal information. All data related to your usage, including habit tracking or progress, is stored locally on your device and never sent to any servers.

2. No Internet Connection Required
ViceFree works completely offline. The app does not require an internet connection to function, and no data is transmitted to us or any third parties.

3. No Third-Party Services
We do not use any analytics tools, advertising networks, or third-party SDKs that collect user information.

4. Children’s Privacy
Since we do not collect any data, ViceFree is safe for all users, including children. However, the app is intended for personal self-improvement and may not be suitable for very young users without supervision.

5. Your Control
Because everything is stored on your device, you have complete control over your data. If you uninstall the app, all stored information will be permanently deleted.

6. Changes to This Policy
If our privacy practices ever change, we will update this policy with a new effective date. You can always review the latest version within the app or on our official listing.

7. Contact
If you have any questions about this Privacy Policy, please contact us at:
archiegonzalesthethird@gmail.com
          ''',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
