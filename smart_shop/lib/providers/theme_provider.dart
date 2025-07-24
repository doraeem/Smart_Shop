// providers/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  final SharedPreferences prefs;

  ThemeProvider(this.prefs);

  bool get isDarkMode => prefs.getBool('isDarkMode') ?? false;

  void toggleTheme() {
    final newValue = !isDarkMode;
    prefs.setBool('isDarkMode', newValue);
    notifyListeners();
  }
}