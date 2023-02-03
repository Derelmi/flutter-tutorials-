import 'package:flutter/material.dart';
import 'mytheme_preference.dart';

class ModelTheme extends ChangeNotifier{
  late bool _isDark;
  late MyThemePreferences _prefrences;
  bool get isDark => _isDark;

  ModelTheme() {
    _isDark = false;
    _prefrences =MyThemePreferences();
    getPreferences();
  }
  //Switching the themes
    set isDark(bool value) {
      _isDark = value;
      _prefrences.setTheme(value);
      notifyListeners();
    }

    getPreferences() async {
      _isDark = await _prefrences.getTheme();
      notifyListeners();
    }
}