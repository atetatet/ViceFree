import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final double? scale;
  final Color? color;
  const CustomLoadingIndicator({super.key, this.scale, this.color});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Center(
        child: Transform.scale(
      scale: scale ?? 0.5,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: color ?? colorScheme.onPrimary,
        valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
        strokeWidth: 10,
      ),
    ));
  }
}
