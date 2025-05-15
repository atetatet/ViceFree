// ignore_for_file: unused_local_variable, avoid_print

import 'package:vicefree/2_application/core/services/constants_service.dart';
import 'package:bloc/bloc.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarState> {
  BottomNavbarCubit() : super(BottomNavbarInitial());

  Future<void> onInitial() async {}
}
