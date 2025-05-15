part of 'bottom_navbar_cubit.dart';

sealed class BottomNavbarState {}

final class BottomNavbarInitial extends BottomNavbarState {}

class NotificationReceived extends BottomNavbarState {
  final String title;
  final String body;

  NotificationReceived({
    required this.title,
    required this.body,
  });
}

final class Error extends BottomNavbarState {
  final String message;
  Error({required this.message});

  List<Object?> get props => [message];
}
