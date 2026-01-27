import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color darkBg = Color(0xFF111111);
  static const Color lightBg = Color(0xFFFFFFFF);

  static const Color darkTxt = Color(0xFFFFFFFF);
  static const Color lightTxt = Color(0xFF111111);

  static const Color darkFavorite = Color(0xFFF2C94C);
  static const Color lightFavorite = darkFavorite;

  static const Color darkTitle = darkTxt;
  static const Color lightTitle = darkTitle;

  static const Color darkStar = Color(0x99FFFFFF);
  static const Color lightStar = darkStar;

  static const Color darkBtnBg1 = Color(0xFFF2C94C);
  static const Color lightBtnBg1 = darkBtnBg1;

  static const Color darkBtnTxt1 = Color(0xFF111111);
  static const Color lightBtnTxt1 = darkBtnTxt1;

  static const Color darkBtnBg2 = darkTxt;
  static const Color lightBtnBg2 = lightTxt;

  static const Color darkBtnTxt2 = darkTxt;
  static const Color lightBtnTxt2 = lightTxt;

  static const Color darkSearch = Color(0xFF2A2A2A);
  static const Color lightSearch = Color(0xFFF1F1F1);
}

class AppTheme {
  static const String _fontFamily = 'Roboto';

  static TextTheme _textTheme(Color textColor) {
    const base = TextTheme();
    const body = TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.25,
    );

    return base.copyWith(
      bodyLarge: body.copyWith(color: textColor),
      bodyMedium: body.copyWith(color: textColor),
      bodySmall: body.copyWith(color: textColor),
      labelLarge: body.copyWith(color: textColor),
      labelMedium: body.copyWith(color: textColor),
      labelSmall: body.copyWith(color: textColor),
    );
  }

  static const TextStyle _appBarTitleLight = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 30,
    height: 1.1,
    color: AppColors.lightTxt,
  );

  static const TextStyle _appBarTitleDark = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 30,
    height: 1.1,
    color: AppColors.darkTxt,
  );

  static const TextStyle _buttonText = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.2,
  );

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightBtnBg1,
      onPrimary: AppColors.lightBtnTxt1,
      surface: AppColors.lightBg,
      onSurface: AppColors.lightTxt,
    ),
    textTheme: _textTheme(AppColors.lightTxt),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBg,
      foregroundColor: AppColors.lightTxt,
      elevation: 0,
      titleTextStyle: _appBarTitleLight,
      toolbarTextStyle: _appBarTitleLight,
    ),
    iconTheme: const IconThemeData(color: AppColors.lightTxt),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(textStyle: _buttonText),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(textStyle: _buttonText),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(textStyle: _buttonText),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(textStyle: _buttonText),
    ),
    // inputDecorationTheme: const InputDecorationTheme(
    //   filled: true,
    //   fillColor: AppColors.lightSearch,
    //   border: OutlineInputBorder(borderSide: BorderSide.none),
    // ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkBtnBg1,
      onPrimary: AppColors.darkBtnTxt1,
      surface: AppColors.darkBg,
      onSurface: AppColors.darkTxt,
    ),
    textTheme: _textTheme(AppColors.darkTxt),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBg,
      foregroundColor: AppColors.darkTxt,
      elevation: 0,
      titleTextStyle: _appBarTitleDark,
      toolbarTextStyle: _appBarTitleDark,
    ),
    iconTheme: const IconThemeData(color: AppColors.darkTxt),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(textStyle: _buttonText),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(textStyle: _buttonText),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(textStyle: _buttonText),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(textStyle: _buttonText),
    ),
    // inputDecorationTheme: const InputDecorationTheme(
    //  filled: true,
    //   fillColor: AppColors.darkSearch,
    //   border: OutlineInputBorder(borderSide: BorderSide.none),
    // ),
  );
}
