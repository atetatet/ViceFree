part of 'add_vice_cubit.dart';

@immutable
sealed class AddViceState {}

final class AddViceInitial extends AddViceState {}

final class BackgroundColorOnChanged extends AddViceState {}

final class Saved extends AddViceState {}

final class OnClosed extends AddViceState {}
