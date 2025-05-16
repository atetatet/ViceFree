// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vicefree/0_data/models/vices_model.dart';
import 'package:vicefree/2_application/core/services/sqflite_service.dart';

part 'edit_vice_state.dart';

class EditViceCubit extends Cubit<EditViceState> {
  EditViceCubit() : super(EditViceInitial());

  TextEditingController viceNameController = TextEditingController();
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  VicesModel vicesModel = VicesModel();
  DatabaseHelper db = DatabaseHelper();

  onInitial(VicesModel model) {
    vicesModel = model;
    viceNameController.text = vicesModel.viceName ?? '';
    pickerColor = Color(int.parse(model.backgroundColor!));
    emit(Loaded());
  }

  void changeColor(Color color) {
    pickerColor = color;
    emit(BackgroundColorOnChanged());
  }

  Future<void> onSave() async {
    var backgroundColor = colorToHexLiteral(pickerColor);

    await db.updateVice(vicesModel.id!, {
      'viceName': viceNameController.text,
      'backgroundColor': backgroundColor,
    });

    emit(Saved());
  }

  Future<void> onDelete() async {
    await db.deleteVice(vicesModel.id!);
    emit(Deleted());
  }

  String colorToHexLiteral(Color color) {
    return '0x${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }
}
