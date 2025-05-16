import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:vicefree/0_data/models/vices_model.dart';
import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:vicefree/2_application/core/widgets/appbar.dart';
import 'package:vicefree/2_application/core/widgets/button.dart';
import 'package:vicefree/2_application/core/widgets/scaffold.dart';
import 'package:vicefree/2_application/core/widgets/textformfield.dart';
import 'package:vicefree/2_application/pages/edit_vice/cubit/edit_vice_cubit.dart';

class EditVicePageWrapper extends StatelessWidget {
  VicesModel model;
  EditVicePageWrapper({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditViceCubit()..onInitial(model),
      child: const EditVicePage(),
    );
  }
}

class EditVicePage extends StatelessWidget {
  const EditVicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final fontService = FontService();

    var cubit = context.read<EditViceCubit>();

    return CustomScaffold(
      appBar: CustomAppbar(),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What Vice Are You Quitting?',
                style: fontService.s30wNormal(context),
              ),
              SizedboxService.h20,
              Text(
                'Vice Name:',
                style: fontService.s14w400(context),
              ),
              CustomTextformfield(
                controller: cubit.viceNameController,
                fillColor: color.onSecondaryContainer,
                hintText: 'Vice Name: e.g Smoking',
                hintStyle: fontService.s14w400Grey(context),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              SizedboxService.h20,
              Text(
                'Background color:',
                style: fontService.s14w400(context),
              ),
              BlocBuilder<EditViceCubit, EditViceState>(
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Pick a color'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: cubit.pickerColor,
                                  onColorChanged: cubit.changeColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    // setState(() => currentColor = pickerColor);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    text: 'Change',
                    backgroundColor: cubit.pickerColor,
                    borderColor: cubit.pickerColor,
                    minimumSize: Size(50, 50),
                  );
                },
              ),
              SizedboxService.h30,
              BlocConsumer<EditViceCubit, EditViceState>(
                listener: (context, state) {
                  if (state is Saved) {
                    toastification.show(
                      backgroundColor: color.secondary,
                      context: context,
                      icon: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      title: Text(
                        'Successfully Saved',
                        style: fontService.s14w400White(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      description: Text(
                        "Updated data for ${cubit.viceNameController.text}.",
                        style: fontService.s14w400White(context),
                      ),
                      primaryColor: Colors.white,
                      alignment: Alignment.topCenter,
                      showProgressBar: false,
                      closeOnClick: true,
                      foregroundColor: Colors.white,
                      autoCloseDuration: const Duration(seconds: 4),
                      callbacks: ToastificationCallbacks(
                          onAutoCompleteCompleted: (_) {}),
                    );

                    context.replace('/home');
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onTap: cubit.onSave,
                    text: 'Save',
                  );
                },
              ),
              BlocConsumer<EditViceCubit, EditViceState>(
                listener: (context, state) {
                  if (state is Deleted) {
                    toastification.show(
                      backgroundColor: color.secondary,
                      context: context,
                      icon: const Icon(
                        Icons.check,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Back to Square One',
                        style: fontService.s14w400White(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      description: Text(
                        "It's tough, but quitting is a journey. Let's take another step forward, together.",
                        style: fontService.s14w400White(context),
                      ),
                      primaryColor: Colors.white,
                      alignment: Alignment.topCenter,
                      showProgressBar: false,
                      closeOnClick: true,
                      foregroundColor: Colors.white,
                      autoCloseDuration: const Duration(seconds: 4),
                      callbacks: ToastificationCallbacks(
                          onAutoCompleteCompleted: (_) {}),
                    );

                    context.replace('/home');
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Are You Sure?"),
                              content: Text(
                                "This will stop tracking your progress for quitting ${cubit.viceNameController.text}. Do you want to proceed?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                    cubit.onDelete();
                                  },
                                  child: const Text("Proceed"),
                                ),
                              ],
                            );
                          });
                    },
                    text: 'Delete',
                    backgroundColor: Color(0xFF990000),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
