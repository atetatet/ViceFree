import 'package:vicefree/2_application/core/services/constants_service.dart';
import 'package:vicefree/2_application/core/services/enum_service.dart';
import 'package:vicefree/2_application/core/services/sqflite_service.dart';
import 'package:vicefree/2_application/core/services/validation_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> onInitial() async {
    emit(Loading());

    DatabaseHelper db = DatabaseHelper();
    final List<Map<String, dynamic>> vices = await db.fetchVices();

    var test = vices;
  }
}
