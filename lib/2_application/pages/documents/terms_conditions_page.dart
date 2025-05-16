// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '''
ViceFree - Terms and Conditions
Effective Date: May 16, 2025

Welcome to ViceFree! By using our app, you agree to the following terms and conditions. Please read them carefully.

1. No Data Collection
We respect your privacy. ViceFree does not collect, store, share, or transmit any personal data. All activity and progress are stored locally on your device and are not accessible to us or any third party.

2. Personal Use Only
ViceFree is intended for personal, non-commercial use as a self-help tool. It should not be used as a substitute for professional medical or mental health advice.

3. No Warranties
ViceFree is provided “as is” without any warranties, express or implied. We make no guarantees that the app will be error-free, uninterrupted, or that it will meet your expectations.

4. User Responsibility
Your use of ViceFree is entirely at your own risk. You are solely responsible for how you use the app and how it impacts your habits and lifestyle.

5. Intellectual Property
All content, design, and functionality in the app are the property of the developer. You may not reverse engineer, duplicate, or redistribute any part of the app.

6. Limitation of Liability
We are not liable for any direct, indirect, incidental, or consequential damages resulting from the use or inability to use ViceFree.

7. Changes to Terms
These terms may be updated periodically. We will notify you of any changes by updating this page with a new effective date.

8. Contact Us
If you have questions or concerns about these terms, feel free to contact us at:
archiegonzalesthethird@gmail.com
          ''',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
