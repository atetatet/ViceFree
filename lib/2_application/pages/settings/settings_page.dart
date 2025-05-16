// ignore_for_file: unused_field, prefer_final_fields

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:vicefree/2_application/core/widgets/appbar.dart';
import 'package:vicefree/2_application/core/widgets/empty.dart';
import 'package:vicefree/2_application/core/widgets/scaffold.dart';
import 'package:vicefree/2_application/pages/settings/cubit/settings_cubit.dart';

class SettingsPageWrapper extends StatelessWidget {
  const SettingsPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit()..onInitial(),
      child: ProfilePage(),
    );
  }
}

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  String _fullName = '';
  String _imageURL = '';
  File? _imageFile;
  Uint8List? _imageUInt;

  @override
  Widget build(BuildContext context) {
    var fontService = FontService();
    var color = Theme.of(context).colorScheme;
    return CustomScaffold(
      appBar: CustomAppbar(
        centerTitle: true,
        title: 'Settings',
        leading: EmptyWidget(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocConsumer<SettingsCubit, SettingsState>(
            listener: (cubitContext, state) {},
            builder: (cubitContext, state) {
              var cubit = context.read<SettingsCubit>();
              return Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                    width: 80,
                  ),
                  SizedboxService.h20,
                  RichText(
                    text: TextSpan(
                      text: 'Vice',
                      style: fontService.s20w700(context),
                      children: [
                        TextSpan(
                            text: 'Free',
                            style: fontService
                                .s20w700(context)
                                .copyWith(color: color.primary))
                      ],
                    ),
                  ),
                  SizedboxService.h10,
                  _widgetList(context, 'Privacy Policy', Icons.notes, () {
                    context.push('/privacy-policy');
                  }, fontService),
                  _widgetList(context, 'Terms and Conditions', Icons.notes, () {
                    context.push('/terms-conditions');
                  }, fontService),
                  SizedboxService.h20,
                  Text(
                    cubit.appVersion,
                    textAlign: TextAlign.center,
                  ),
                  SizedboxService.h40,
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _widgetList(BuildContext context, String title, IconData icon,
      Function() onTap, FontService fontService) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Container(
          color: const Color(0xFFF5F5F5),
          child: ListTile(
            leading: Icon(
              icon,
              size: 16,
            ),
            title: Text(
              title,
              style: fontService.s12w400(context),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
