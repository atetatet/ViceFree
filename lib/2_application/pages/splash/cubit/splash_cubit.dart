import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vicefree/2_application/core/services/constants_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> onInitial(context) async {
    await Future.delayed(const Duration(seconds: 1));
    await checkOnboarding(context);
  }

  Future<void> checkOnboarding(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Get the user's onboarding status
    bool status = prefs.getBool(ConstantsService.onboarding) ?? false;
    if (status) {
      emit(GoToHome());
    } else {
      emit(GoToIntroduction());
    }
  }
}
