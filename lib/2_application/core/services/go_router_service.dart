import 'package:vicefree/2_application/pages/add_vice/add_vice_page.dart';
import 'package:vicefree/2_application/pages/bottom_navbar/bottom_navbar_page.dart';
import 'package:vicefree/2_application/pages/home/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vicefree/2_application/pages/introduction/introduction_page.dart';
import 'package:vicefree/2_application/pages/splash/splash_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SplashPageWrapper(),
    ),
    GoRoute(
      path: '/intro',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const IntroductionPageWrapper(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return BottomNavbarPageWrapperProvider(
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const HomePageWrapper(),
        ),
        GoRoute(
          path: '/add-vice',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const AddVicePageWrapper(),
        ),
      ],
    ),
  ],
);
