// ignore_for_file: must_be_immutable

import 'package:vicefree/2_application/core/widgets/appbar.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  Widget body;
  CustomAppbar? appBar;
  Widget? drawer;
  Color? backgroundColor;
  Widget? floatingActionButton;
  Widget? bottomNavigationBar;
  PreferredSize? appBarAlerts;

  CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.drawer,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.appBarAlerts,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true, // This is true by default
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: backgroundColor ?? theme.primaryContainer,
        appBar: appBarAlerts ?? appBar,
        drawer: drawer,
        floatingActionButton: floatingActionButton,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
