// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class NoRecord extends HomeState {}

final class OnRefresh extends HomeState {}

final class Success extends HomeState {}

final class UpdateTime extends HomeState {}

final class Loading extends HomeState {}

final class Error extends HomeState {
  final String message;
  Error({required this.message});

  List<Object?> get props => [message];
}
