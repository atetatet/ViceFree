import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';
import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:vicefree/2_application/core/widgets/appbar.dart';
import 'package:vicefree/2_application/core/widgets/button.dart';
import 'package:vicefree/2_application/core/widgets/scaffold.dart';
import 'package:vicefree/2_application/core/widgets/textformfield.dart';
import 'package:vicefree/2_application/core/widgets/toastification.dart';
import 'package:vicefree/2_application/pages/add_vice/cubit/add_vice_cubit.dart';

class AddVicePageWrapper extends StatelessWidget {
  const AddVicePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddViceCubit(),
      child: const AddViceePage(),
    );
  }
}

class AddViceePage extends StatelessWidget {
  const AddViceePage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final fontService = FontService();

    var cubit = context.read<AddViceCubit>();

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
              BlocBuilder<AddViceCubit, AddViceState>(
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
              BlocConsumer<AddViceCubit, AddViceState>(
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
                        'Well Done!',
                        style: fontService.s14w400White(context).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      description: Text(
                        "Congratulations! You've taken a huge step by quitting ${cubit.viceNameController.text}.",
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

                    context.go('/home');
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onTap: cubit.onSave,
                    text: 'Save',
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
