import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0XFF4DB8B8),
  onPrimary: Colors.black,
  primaryContainer: Colors.white,
  onPrimaryContainer: Colors.black,
  secondary: Color(0xFF273238),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFF84343),
  onError: Colors.white,
  surface: Colors.white,
  onSurface: Colors.black,
  onTertiary: Color(0xFF273238),
  onSecondaryContainer: Color(0xFFF5F5F5),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF96416A),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFD8E6),
  onPrimaryContainer: Color(0xFF3D0024),
  secondary: Color(0xFF735761),
  onSecondary: Color(0xFF735761),
  error: Color(0xFF735761),
  onError: Color(0xFF735761),
  surface: Color(0xFF735761),
  onSurface: Color(0xFF735761),
);

final Map<String, Color> letterColorMap = {
  'A': Colors.red,
  'B': Colors.blue,
  'C': Colors.green,
  'D': Colors.yellow,
  'E': Colors.orange,
  'F': Colors.purple,
  'G': Colors.pink,
  'H': Colors.teal,
  'I': Colors.indigo,
  'J': Colors.lime,
  'K': Colors.amber,
  'L': Colors.cyan,
  'M': Colors.brown,
  'N': Colors.grey,
  'O': Colors.deepPurple,
  'P': Colors.deepOrange,
  'Q': Colors.lightBlue,
  'R': Colors.lightGreen,
  'S': Colors.lightGreen.shade200,
  'T': Colors.yellowAccent.shade100,
  'U': Colors.orangeAccent,
  'V': Colors.purpleAccent,
  'W': Colors.redAccent,
  'X': Colors.greenAccent,
  'Y': Colors.blueAccent,
  'Z': Colors.yellowAccent,
};

Color getColor(String name) {
  if (name.isEmpty) return Colors.black; // Default color
  String firstLetter = name[0].toUpperCase();
  return letterColorMap[firstLetter] ?? Colors.black; // Fallback color
}
