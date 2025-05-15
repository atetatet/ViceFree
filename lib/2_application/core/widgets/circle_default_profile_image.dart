import 'dart:math';

import 'package:vicefree/2_application/core/services/colors_service.dart';
import 'package:flutter/material.dart';

class CircleDefaultProfileImage extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final double? fontSize;

  const CircleDefaultProfileImage({
    super.key,
    required this.name,
    this.width = 40,
    this.height = 40,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: name == '' ? Colors.black : getColor(name[0]),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name == '' ? '' : name[0],
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
