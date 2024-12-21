import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';

class AppThere {
  ThemeData getThemeData() => ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: UiColor().card),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: UiColor().card),
            borderRadius: BorderRadius.circular(7.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: UiColor().card),
            borderRadius: BorderRadius.circular(7.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(color: UiColor().card),
          ),
          fillColor: UiColor().card,
          filled: true,
        ),
        dividerTheme: DividerThemeData(
          color: UiColor().backgroundButton,
          thickness: 0.4,
        ),
        appBarTheme: AppBarTheme(color: UiColor().backgroundButton),
        scaffoldBackgroundColor: UiColor().backgroundButton,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
        ),
      );
}
