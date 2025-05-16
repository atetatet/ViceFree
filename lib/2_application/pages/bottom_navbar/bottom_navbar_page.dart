// ignore_for_file: must_be_immutable, use_build_context_synchronously, unused_field, no_leading_underscores_for_local_identifiers

import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:vicefree/2_application/core/services/sizedbox_service.dart';
import 'package:vicefree/2_application/core/widgets/scaffold.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:vicefree/2_application/pages/bottom_navbar/cubit/bottom_navbar_cubit.dart';

class BottomNavbarPageWrapperProvider extends StatelessWidget {
  final Widget child;
  const BottomNavbarPageWrapperProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavbarCubit()..onInitial(),
      child: BottomNavbarPage(
        child: child,
      ),
    );
  }
}

class BottomNavbarPage extends StatefulWidget {
  Widget child;
  BottomNavbarPage({
    super.key,
    required this.child,
  });

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int _currentPage = 0;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;
    var fontService = FontService();

    List<CurvedNavigationBarItem> _pages = <CurvedNavigationBarItem>[
      CurvedNavigationBarItem(
        child: Icon(
          Icons.dashboard,
          size: 25,
          color: Colors.white,
        ),
        label: 'Dashboard',
        labelStyle: fontService.bottomNavbarLabel(context),
      ),
      // CurvedNavigationBarItem(
      //   child: Icon(
      //     FontAwesomeIcons.circleUser,
      //     size: 25,
      //     color: Colors.white,
      //   ),
      //   label: 'Profile',
      //   labelStyle: fontService.bottomNavbarLabel(context),
      // ),
      CurvedNavigationBarItem(
        child: Icon(
          Icons.settings,
          size: 28,
          color: Colors.white,
        ),
        label: 'Settings',
        labelStyle: fontService.bottomNavbarLabel(context),
      ),
    ];

    return BlocConsumer<BottomNavbarCubit, BottomNavbarState>(
      listener: (context, state) {
        if (state is NotificationReceived) {
          showDialog<String>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                _widgetDialog(context, state.title, state.body),
          );
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          key: key,
          body: SafeArea(child: widget.child),
          bottomNavigationBar: CurvedNavigationBar(
            key: bottomNavigationKey,
            backgroundColor: Colors.white,
            index: _currentPage,
            color: defaultColorScheme.primary,
            items: _pages,
            onTap: (index) {
              GoRouter router = GoRouter.of(context);
              setState(() {
                _currentPage = index;
              });
              switch (index) {
                case 0:
                  router.go('/home');
                  break;
                case 1:
                  router.go('/settings');
                  break;
                default:
              }
            },
          ),
        );
      },
    );
  }

  AlertDialog _widgetDialog(
      BuildContext context, String title, String description) {
    return AlertDialog(
      title: Column(
        children: [
          const Icon(
            Icons.warning,
            size: 50,
            color: Colors.red,
          ),
          SizedboxService.h15,
          Text(
            title,
            style: FontService().s16w700(context),
          ),
        ],
      ),
      content: Text(description),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            context.pop();
            setState(() {
              _currentPage = 4;
            });
            context.go('/notification');
          },
          child: const Text('Go to notifications'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'Close'),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
