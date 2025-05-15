part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class Loading extends SplashState {}

class GoToIntroduction extends SplashState {}

class GoToHome extends SplashState {}
