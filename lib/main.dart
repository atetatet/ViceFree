// ignore_for_file: unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vicefree/2_application/core/services/constants_service.dart';
import 'package:vicefree/2_application/core/widgets/custom_error.dart';
import 'package:vicefree/2_application/pages/main_app/main_app_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  // await _getFlavour();

  // String firebaseAPIKey = dotenv.env['FirebaseAPIKey'] ?? '';
  // String firebaseAppId = dotenv.env['FirebaseAppId'] ?? '';
  // String firebaseMessagingSenderId =
  //     dotenv.env['FirebaseMessagingSenderId'] ?? '';
  // String firebaseProjectId = dotenv.env['FirebaseProjectId'] ?? '';

  // if (Platform.isAndroid) {
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //     apiKey: firebaseAPIKey,
  //     appId: firebaseAppId,
  //     messagingSenderId: firebaseMessagingSenderId,
  //     projectId: firebaseProjectId,
  //   ));
  // } else {
  //   await Firebase.initializeApp();
  // }

  // Initialize local notifications
  // final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // const initializationSettings = InitializationSettings(
  //   iOS: DarwinInitializationSettings(),
  //   android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  // );
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Override the default error widget
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return CustomErrorWidget(details);
  };

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) async {
    runApp(const MainApp());
  });
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   // Can log or handle something here if needed
// }
