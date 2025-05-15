import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vicefree/2_application/core/services/constants_service.dart';

part 'introduction_state.dart';

class IntroductionCubit extends Cubit<IntroductionState> {
  IntroductionCubit() : super(IntroductionInitial());

  Future<void> onEnd(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(ConstantsService.onboarding, true);

    emit(GoToHome());
  }
}
