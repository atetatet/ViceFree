// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontService {
  TextStyle bottomNavbarLabel(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: theme.onSecondary,
    );
  }

  TextStyle titleLarge(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: theme.onPrimary,
    );
  }

  TextStyle titleMedium(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: theme.onPrimary,
    );
  }

  TextStyle subtitle(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: theme.onPrimary,
    );
  }

  TextStyle s32w700White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  TextStyle s40w700White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  TextStyle s40w700Splash(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      letterSpacing: 5,
    );
  }

  TextStyle s40w700Primary(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GoogleFonts.roboto(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      color: theme.primary,
      letterSpacing: 5,
    );
  }

  TextStyle s80w700White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 80,
      fontWeight: FontWeight.w300,
      color: Colors.white,
    );
  }

  TextStyle s32w700(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: theme.onPrimary,
    );
  }

  TextStyle s24w700(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: theme.onPrimary,
    );
  }

  TextStyle s20w700(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: theme.onPrimary,
    );
  }

  TextStyle s20w700White(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: theme.onSecondary,
    );
  }

  TextStyle s20w400(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  TextStyle s16w700White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  TextStyle s16w400White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  TextStyle s16w700(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: theme.onPrimary,
    );
  }

  TextStyle s16w400(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: theme.onPrimary,
    );
  }

  TextStyle s16w500(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: theme.onPrimary,
    );
  }

  TextStyle s14w400(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: theme.onPrimary,
    );
  }

  TextStyle s14w700(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: theme.onPrimary,
    );
  }

  TextStyle s14w700Yellow(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFF7B125),
    );
  }

  TextStyle s12w700Yellow(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: theme.primary,
    );
  }

  TextStyle s13w700YellowUnderline(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: theme.primary,
      decoration: TextDecoration.underline,
    );
  }

  TextStyle s14w700Red(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFF33e58),
    );
  }

  TextStyle s14w400Grey(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    );
  }

  TextStyle s14w700White(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: theme.surface,
    );
  }

  TextStyle s13w400(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: theme.onPrimary,
    );
  }

  TextStyle s12w400(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: theme.onPrimary,
    );
  }

  TextStyle s12w400FadedGrey(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF757C80),
    );
  }

  TextStyle s12w500FadedGrey(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF757C80),
    );
  }

  TextStyle s12w400Grey(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF90A4AE),
    );
  }

  TextStyle s14w400White(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  TextStyle s10w700Grey(BuildContext context) {
    return GoogleFonts.roboto(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    );
  }

  TextStyle s14w500(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: theme.onPrimary,
    );
  }

  TextStyle s19w700(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: theme.onPrimary,
    );
  }

  TextStyle s30wNormal(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return GoogleFonts.roboto(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: theme.onPrimary,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
