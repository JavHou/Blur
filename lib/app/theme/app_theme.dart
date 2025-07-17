import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        secondary: Color(0xFF6656FF),
        primary: Color(0xFFAB3FFF),
        error: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      bottomAppBarTheme: BottomAppBarTheme(elevation: 8),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 8),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.blue.shade700;
          }
          return Colors.grey.shade300;
        }),
        trackOutlineColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.blue.shade700;
          }
          return Colors.grey.shade300;
        }),
        overlayColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.blue.shade700;
          }
          return Colors.transparent;
        }),
        thumbColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.black;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.blue.shade700;
          }
          return Colors.white;
        }),
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return BorderSide(color: Colors.blue.shade700);
          }
          return BorderSide(color: Colors.grey.shade400);
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color(0xff1A47FF)),
          padding: WidgetStatePropertyAll(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          textStyle: WidgetStatePropertyAll(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      textTheme: _lightTextTheme,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        filled: true,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.grey.shade700,
          letterSpacing: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blue.shade800),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      sliderTheme: SliderThemeData(
        valueIndicatorTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Add more theme properties as needed
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      bottomAppBarTheme: BottomAppBarTheme(elevation: 8),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 8),
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          textStyle: WidgetStatePropertyAll(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      textTheme: _darkTextTheme,
      colorScheme: ColorScheme.dark(brightness: Brightness.dark),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      // Add more theme properties as needed
    );
  }

  // Light Text Theme
  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.normal),
    displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.normal),
    displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.normal),
    headlineLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.normal),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  );

  // Dark Text Theme
  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.normal),
    displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.normal),
    displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.normal),
    headlineLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.normal),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  );
}
