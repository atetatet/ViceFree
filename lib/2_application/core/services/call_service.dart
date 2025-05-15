import 'package:url_launcher/url_launcher.dart';

void makePhoneCall(String phoneNumber) async {
  final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);

  if (await canLaunchUrl(phoneUrl)) {
    await launchUrl(phoneUrl);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}
