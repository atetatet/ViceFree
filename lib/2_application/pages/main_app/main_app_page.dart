import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vicefree/2_application/core/services/go_router_service.dart';
import 'package:vicefree/2_application/core/services/theme_service.dart';
import 'package:vicefree/2_application/pages/main_app/cubit/main_app_cubit.dart';
import 'package:vicefree/main.dart';

class MainAppWrapper extends StatelessWidget {
  const MainAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainAppCubit()..onInitial(context),
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp.router(
          key: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: _lightThemeData(themeProvider),
          // darkTheme: _darkThemeData(themeProvider),
          routerConfig: router,
        );
      }),
    );
  }

  ThemeData _lightThemeData(ThemeProvider themeProvider) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: themeProvider.lightScheme,
      scaffoldBackgroundColor: themeProvider.lightScheme.primaryContainer,
      dialogTheme: DialogTheme(
        backgroundColor: themeProvider.lightScheme.surface,
      ),
      textTheme: TextTheme(
        bodyLarge: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ), // Default text color for dark mode,
        bodyMedium: const TextStyle(
          color: Colors.black,
        ),
        bodySmall: const TextStyle(
            color: Colors.black), // Default text color for dark mode
        titleLarge: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: themeProvider.darkScheme.onPrimary,
        ),
        titleMedium: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: themeProvider.darkScheme.onPrimary,
        ),
        titleSmall: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: themeProvider.darkScheme.onPrimary,
        ),
      ),
      cardTheme: CardTheme(
        color: themeProvider.lightScheme.surface,
      ),
      listTileTheme: ListTileThemeData(
        tileColor: themeProvider.lightScheme.surface,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black, // Set cursor color
        selectionColor: Colors.lightBlueAccent, // Set selection highlight color
        selectionHandleColor: Colors.blue, // Set selection handle color
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
        selectedColor: Colors.green,
      ),
    );
  }

  ThemeData _darkThemeData(ThemeProvider themeProvider) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: themeProvider.darkScheme,
    );
  }
}
