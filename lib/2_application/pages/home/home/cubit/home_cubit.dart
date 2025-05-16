import 'package:vicefree/0_data/models/vices_model.dart';
import 'package:vicefree/2_application/core/services/sqflite_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<VicesModel> list = [];

  Future<void> onInitial() async {
    emit(Loading());

    DatabaseHelper db = DatabaseHelper();
    final List<Map<String, dynamic>> vices = await db.fetchVices();

    if (vices.isEmpty) {
      emit(NoRecord());
      return;
    }

    for (var item in vices) {
      VicesModel model = VicesModel.fromJson(item);
      list.add(model);
    }

    emit(Success());
  }

  Future<void> onRefresh() async {
    emit(OnRefresh());
  }
}
