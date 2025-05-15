// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vicefree/2_application/core/services/date_format_service.dart';
import 'package:vicefree/2_application/core/services/sqflite_service.dart';

part 'add_vice_state.dart';

class AddViceCubit extends Cubit<AddViceState> {
  AddViceCubit() : super(AddViceInitial());

  final viceNameController = TextEditingController();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    pickerColor = color;
    emit(BackgroundColorOnChanged());
  }

  Future<void> onSave() async {
    // var backgroundColor = colorToHexLiteral(pickerColor);

    // DatabaseHelper db = DatabaseHelper();

    // final now = DateTime.now().toIso8601String();
    // await db.saveVice({
    //   'title': viceNameController.text,
    //   'backgroundColor': backgroundColor,
    //   'timestamp': stringDateToTimestamp(now),
    // });

    emit(Saved());
  }

  String colorToHexLiteral(Color color) {
    return '0x${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
