import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;
  final Color? primary;
  final Color? onPrimary;
  final Size? minimumSize;
  final double? elevation;
  final TextStyle? textStyle;
  final double? width;
  final OutlinedBorder? shape;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final BoxDecoration? decoration;
  final Widget? textWidget;
  final BorderRadiusGeometry? borderRadius;
  final bool? enabled;
  final bool? isSaving;
  final Widget? icon;

  const CustomButtonWithIcon({
    super.key,
    this.text,
    this.onTap,
    this.primary,
    this.onPrimary,
    this.minimumSize,
    this.elevation,
    this.textStyle,
    this.width,
    this.shape,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.decoration,
    this.textWidget,
    this.borderRadius,
    this.enabled,
    this.isSaving,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ElevatedButton.icon(
        onPressed: isSaving == true
            ? null
            : (enabled ?? true)
                ? onTap
                : null,
        icon: icon, // Specify the icon
        label: Text(
          text ?? '',
          style: textStyle,
          textAlign: TextAlign.center,
        ), // Specify the text
        style: ElevatedButton.styleFrom(
          textStyle: textStyle,
          backgroundColor: backgroundColor ?? theme.secondary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: (enabled ?? true)
                  ? borderColor ?? theme.secondary
                  : Colors.transparent,
            ),
            borderRadius:
                borderRadius ?? BorderRadius.circular(10), // <-- Radius
          ),
          elevation: elevation,
          minimumSize:
              minimumSize ?? Size(MediaQuery.of(context).size.width, 60),
        ),
      ),
      // ElevatedButton(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: backgroundColor ?? theme.secondary,
      //     shape: RoundedRectangleBorder(
      //       side: BorderSide(
      //         color: (enabled ?? true)
      //             ? borderColor ?? theme.secondary
      //             : Colors.transparent,
      //       ),
      //       borderRadius:
      //           borderRadius ?? BorderRadius.circular(10), // <-- Radius
      //     ),
      //     elevation: elevation,
      //     minimumSize:
      //         minimumSize ?? Size(MediaQuery.of(context).size.width, 60),
      //   ),
      //   child: isSaving == true
      //       ? const CustomLoadingIndicator()
      //       : Text(
      //           text ?? "",
      //           style: textStyle ??
      //               GoogleFonts.roboto(
      //                 fontSize: 12,
      //                 fontWeight: FontWeight.w500,
      //                 color: textColor ?? Colors.white,
      //               ),
      //         ),
      // ),
    );
  }
}
