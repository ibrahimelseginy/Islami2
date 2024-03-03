import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.system;
  String language = 'ar';
  SharedPreferences? sharedPreferences;

  changeTheme(ThemeMode themeMode) {
    theme = themeMode;
    notifyListeners();
    saveTheme(themeMode);
  }

  changLanguage(String lang) {
    language = lang;
    notifyListeners();
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    String newTheme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await sharedPreferences!.setString('theme', newTheme);
  }

  String? getTheme() {
    return sharedPreferences!.getString('theme');
  }

  Future<void> loadTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? oldTheme = getTheme();
    if (oldTheme != null) {
      theme = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }
}
