// import 'package:vicefree/2_application/core/services/font_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final IconThemeData? actionsIconTheme;
  final double? titleSpacing;
  final bool Function(ScrollNotification)? notificationPredicate;
  final Color? shadowColor;
  final double? scrolledUnderElevation;
  final PreferredSizeWidget? bottom;
  final double? elevation;

  const CustomAppbar({
    super.key,
    this.title,
    this.centerTitle,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.actionsIconTheme,
    this.titleSpacing,
    this.notificationPredicate,
    this.shadowColor,
    this.scrolledUnderElevation,
    this.bottom,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
      actionsIconTheme: actionsIconTheme,
      title: Text(title ?? ''),
      centerTitle: centerTitle ?? false,
      titleSpacing: titleSpacing ?? 0,
      leading: leading ??
          InkWell(
            onTap: () {
              context.pop();
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
      actions: actions,
      shadowColor: shadowColor,
      scrolledUnderElevation: scrolledUnderElevation ?? 4,
      bottom: bottom,
      notificationPredicate: (ScrollNotification notification) {
        return notification.depth == 1;
      },
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
