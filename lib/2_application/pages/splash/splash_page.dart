// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:vicefree/2_application/core/widgets/scaffold.dart';
import 'package:vicefree/2_application/pages/splash/cubit/splash_cubit.dart';

class SplashPageWrapper extends StatelessWidget {
  const SplashPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..onInitial(context),
      child: SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  bool isSessionValid = false;
  @override
  Widget build(BuildContext context) {
    var fontService = FontService();

    return CustomScaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is GoToIntroduction) {
            context.go('/intro');
          } else if (state is GoToHome) {
            context.go('/home');
          }
        },
        builder: (context, state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 140,
                  width: 140,
                ),
                SizedboxService.h20,
                RichText(
                  text: TextSpan(
                    text: 'Vice',
                    style: fontService.s40w700Splash(context),
                    children: [
                      TextSpan(
                          text: 'Free',
                          style: fontService.s40w700Primary(context))
                    ],
                  ),
                ),
                SizedboxService.h10,
                // Text(
                //   'Disaster Emergency',
                //   style: fontService.s20w700White(context),
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
