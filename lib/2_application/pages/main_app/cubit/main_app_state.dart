part of 'main_app_cubit.dart';

sealed class MainAppState {}

final class MainAppInitial extends MainAppState {}

class NotificationReceived extends MainAppState {
  final String title;
  final String body;

  NotificationReceived({
    required this.title,
    required this.body,
  });
}
