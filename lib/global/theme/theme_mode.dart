import 'package:flutter/material.dart';
import 'package:ga_proj/global/theme/themedark.dart';
import 'package:ga_proj/global/theme/themeligth.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? _prefs;

const kThemeModeKey = '__theme_mode__';
ThemeModeApp currentTheme = LightModeTheme();

abstract class ThemeModeApp {
  DeviceSize? deviceSize = DeviceSize.mobile;
  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color tertiaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color primaryBtnText;
  late Color lineColor;
  late Color white70;
  late Color primary600;

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static ThemeModeApp of(BuildContext context) {
    return currentTheme;
  }

  DeviceSize getDeviceSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 479) {
      return DeviceSize.mobile;
    } else if (width < 991) {
      return DeviceSize.tablet;
    } else {
      return DeviceSize.desktop;
    }
  }
}

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

enum ThemeMode {
  /// Use either the light or dark theme based on what the user has selected in
  /// the system settings.
  system,

  /// Always use the light mode regardless of system preference.
  light,

  /// Always use the dark mode (if available) regardless of system preference.
  dark,
}
