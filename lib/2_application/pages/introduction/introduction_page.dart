import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:vicefree/2_application/pages/introduction/cubit/introduction_cubit.dart';

class IntroductionPageWrapper extends StatelessWidget {
  const IntroductionPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroductionCubit(),
      child: IntroductionPage(),
    );
  }
}

class IntroductionPage extends StatelessWidget {
  IntroductionPage({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    var fontService = FontService();

    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: fontService.s16w400(context),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    var cubit = context.read<IntroductionCubit>();

    return BlocConsumer<IntroductionCubit, IntroductionState>(
      listener: (context, state) {
        if (state is GoToHome) {
          context.go('/home');
        }
      },
      builder: (context, state) {
        return IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          pages: [
            PageViewModel(
              title: "Welcome to ViceFree",
              body:
                  "Your journey towards a healthier and happier life begins here. ViceFree helps you track your progress and stay motivated as you work towards quitting your vices",
              image: _buildImage('intro1.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "How It Works",
              body:
                  "Simply add the vice you want to quit, track your progress, and see your success grow each day. We’ll help you stay motivated with real-time updates and milestones.",
              image: _buildImage('intro2.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Let's Get Started!",
              body:
                  "Ready to make a change? Start your journey now by adding your first vice and begin tracking your progress towards a better you.",
              image: _buildImage('intro3.png'),
              decoration: pageDecoration,
            ),
            // PageViewModel(
            //   title: "Kids and teens",
            //   body:
            //       "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            //   image: _buildImage('img3.jpg'),
            //   decoration: pageDecoration,
            // ),
            // PageViewModel(
            //   title: "Full Screen Page",
            //   body:
            //       "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
            //   backgroundImage: backgroundImage,
            //   decoration: pageDecoration.copyWith(
            //     contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            //     bodyFlex: 2,
            //     imageFlex: 3,
            //     safeArea: 100,
            //   ),
            // ),
            // PageViewModel(
            //   title: "Another title page",
            //   body: "Another beautiful body text for this example onboarding",
            //   image: _buildImage('img2.jpg'),
            //   footer: ElevatedButton(
            //     onPressed: () {
            //       introKey.currentState?.animateScroll(0);
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.lightBlue,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //     ),
            //     child: const Text(
            //       'FooButton',
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
            //   decoration: pageDecoration.copyWith(
            //     bodyFlex: 6,
            //     imageFlex: 6,
            //     safeArea: 80,
            //   ),
            // ),
            // PageViewModel(
            //   title: "Title of last page - reversed",
            //   bodyWidget: const Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text("Click on ", style: bodyStyle),
            //       Icon(Icons.edit),
            //       Text(" to edit a post", style: bodyStyle),
            //     ],
            //   ),
            //   decoration: pageDecoration.copyWith(
            //     bodyFlex: 2,
            //     imageFlex: 4,
            //     bodyAlignment: Alignment.bottomCenter,
            //     imageAlignment: Alignment.topCenter,
            //   ),
            //   image: _buildImage('img1.jpg'),
            //   reverse: true,
            // ),
          ],
          onDone: () => cubit.onEnd(context),
          onSkip: () => cubit.onEnd(context),
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          //rtl: true, // Display as right-to-left
          back: const Icon(Icons.arrow_back),
          skip:
              const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        );
      },
    );
  }
}
