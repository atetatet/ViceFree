// ignore_for_file: must_be_immutable, unused_field, prefer_final_fields, unnecessary_null_comparison

import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vicefree/2_application/core/services/date_format_service.dart';
import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:vicefree/2_application/core/widgets/button.dart';
import 'package:vicefree/2_application/core/widgets/empty.dart';
import 'package:vicefree/2_application/core/widgets/loading.dart';
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
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is Loading) {
                return CustomLoadingIndicator();
              } else if (state is NoRecord) {
                return _widgetNoRecord(fontService, context, color);
              }
              return _widgetList(fontService, context, color);
            },
          ),
        ),
      ),
    );
  }

  Widget _widgetList(
      FontService fontService, BuildContext context, ColorScheme color) {
    var cubit = context.read<HomeCubit>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My vices',
              style: fontService.s30wNormal(context),
            ),
            FloatingActionButton(
              onPressed: () {
                context.push('/add-vice');
              },
              backgroundColor: color.primary,
              mini: true,
              foregroundColor: Colors.white,
              child: Icon(Icons.add, size: 20), // Customize color
            )
          ],
        ),
        SizedboxService.h10,
        cubit.isAdLoaded
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: cubit.bannerAd.size.width.toDouble(),
                  height: cubit.bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: cubit.bannerAd),
                ),
              )
            : EmptyWidget(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: cubit.onRefresh,
            child: ListView.builder(
              physics:
                  const AlwaysScrollableScrollPhysics(), // Forces scroll even if not needed
              shrinkWrap: true,
              itemCount: cubit.list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push('/edit-vice', extra: cubit.list[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(
                            int.parse(cubit.list[index].backgroundColor!)),
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.grey, width: 0.4), // Bottom border
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.list[index].viceName ?? '',
                              style: fontService.s16w700White(context),
                            ),
                            Text(
                              timeAgo(cubit.list[index].timestamp!),
                              style: fontService.s50w700(context).copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            Spacer(),
                            Text(
                              'since quitting (${formatTimestamp(cubit.list[index].timestamp!)})',
                              style: fontService.s16w400White(context).copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetNoRecord(
      FontService fontService, BuildContext context, ColorScheme color) {
    return Column(
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
    );
  }
}
