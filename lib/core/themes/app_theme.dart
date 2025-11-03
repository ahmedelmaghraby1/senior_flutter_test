import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/enums/responsive_enum.dart';
import 'package:senior_flutter_test/core/extensions/responsive.dart';
import 'package:senior_flutter_test/core/themes/app_colors_scheme.dart';

class AppTheme {
  final AppColorScheme _appColorScheme;

  AppTheme(this._appColorScheme);

  AppColorScheme get appColorScheme => _appColorScheme;

  ThemeData getThemeData(BuildContext context) {
    return ThemeData(
      primaryColor: _appColorScheme.primaryColor,
      colorScheme: ColorScheme(
        brightness: _appColorScheme.brightness,
        primary: _appColorScheme.primaryColor,
        onPrimary: _appColorScheme.dividerColor,
        secondary: _appColorScheme.secondaryColor,
        onSecondary: _appColorScheme.whiteColor,
        error: _appColorScheme.errorColor,
        onError: _appColorScheme.errorColor,
        surface: _appColorScheme.whiteColor,
        onSurface: _appColorScheme.brown,
      ),
      scaffoldBackgroundColor: _appColorScheme.primaryColor,
      fontFamily: 'Inter',
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: context.responsiveUI == ResponsiveUI.web ? 32 : 24,
          fontWeight: FontWeight.w400,
          color: _appColorScheme.textColor.white,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: _appColorScheme.textColor.white,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: _appColorScheme.textColor.white,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: _appColorScheme.textColor.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: _appColorScheme.textColor.lightGrey,
        ),
        bodySmall: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w500,
          color: _appColorScheme.textColor.yellow,
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: _appColorScheme.primaryColor,
        foregroundColor: _appColorScheme.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          ),
          overlayColor: WidgetStateProperty.all(
            _appColorScheme.primaryColor.withAlpha(50),
          ),
          foregroundColor: WidgetStateProperty.all(_appColorScheme.whiteColor),
          elevation: WidgetStateProperty.all(10),
          backgroundColor: WidgetStateProperty.all<Color>(
            _appColorScheme.secondaryColor,
          ),
          minimumSize: WidgetStateProperty.all(const Size(32, 32)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          textStyle: WidgetStateProperty.all(
            TextStyle(
              color: _appColorScheme.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
