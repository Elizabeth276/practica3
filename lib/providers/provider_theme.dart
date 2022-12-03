import 'package:flutter/material.dart';
import 'package:practica3/settings/styles.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme();

  getThemeData() => _themeData;

  setthemData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
