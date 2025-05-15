// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'main_app_state.dart';

class MainAppCubit extends Cubit<MainAppState> {
  MainAppCubit() : super(MainAppInitial());

  void onInitial(BuildContext context) {
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    //   if (message.notification != null) {
    //     final String title = message.notification!.title ?? 'No Title';
    //     final String body = message.notification!.body ?? 'No Body';
    //     final dynamic data = message.data;
    //     navigatorKey.currentContext?.go('/notification');
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    //   if (message.notification != null) {
    //     final String title = message.notification!.title ?? 'No Title';
    //     final String body = message.notification!.body ?? 'No Body';
    //     final dynamic data = message.data;
    //     navigatorKey.currentContext?.go('/notification');
    //   }
    // });
  }
}
