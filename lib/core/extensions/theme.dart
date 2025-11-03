import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/themes/app_colors_scheme.dart';
import 'package:senior_flutter_test/core/themes/app_theme.dart';

extension ThemeApp on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  ThemeData get theme => Theme.of(this);

  AppColorScheme get appColor => Theme.of(this).appColors;

  Color get primaryColor => Theme.of(this).primaryColor;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension GetAppColorTheme on ThemeData {
  AppTheme appTheme([Brightness? brightness]) {
    late AppColorScheme appColorScheme;
    if ((brightness ?? this.brightness) == Brightness.dark) {
      appColorScheme = AppDarkColors();
    } else {
      /// Add light theme here
    }
    return AppTheme(appColorScheme);
  }

  AppColorScheme get appColors {
    return appTheme().appColorScheme;
  }

  Color customColorMode({
    required Color inDarkMode,
    required Color inLightMode,
  }) => brightness == Brightness.light ? inLightMode : inDarkMode;
}
