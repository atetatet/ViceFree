part of 'introduction_cubit.dart';

@immutable
sealed class IntroductionState {}

final class IntroductionInitial extends IntroductionState {}

final class GoToHome extends IntroductionState {}
