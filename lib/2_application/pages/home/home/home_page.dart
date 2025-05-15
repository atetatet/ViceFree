// ignore_for_file: must_be_immutable, unused_field, prefer_final_fields, unnecessary_null_comparison

import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:vicefree/2_application/core/widgets/button.dart';
import 'package:vicefree/2_application/core/widgets/scaffold.dart';
import 'package:vicefree/2_application/pages/home/home/cubit/home_cubit.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..onInitial(),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final fontService = FontService();
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/dashboard.png'),
            SizedboxService.h20,
            Text(
              'Quit your vices with ViceFree. Track progress, set goals, and stay motivated with personalized tips and a supportive community. Start your journey today!',
              style: fontService.s16w400(context),
              textAlign: TextAlign.center,
            ),
            SizedboxService.h20,
            CustomButton(
              onTap: () {
                context.push('/add-vice');
              },
              backgroundColor: color.primary,
              borderColor: color.primary,
              text: 'Start your Journey',
            )
          ],
        ),
      ),
    );
  }
}
