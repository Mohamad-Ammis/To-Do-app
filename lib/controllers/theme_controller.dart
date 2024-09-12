import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/theme/dark_theme.dart';
import 'package:to_do_app/theme/light_theme.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPreferences();
  }

  void toggleTheme(bool isDark) {
    isDarkMode.value = isDark;
    Get.changeTheme(isDark ? darkTheme : lightTheme);
    saveThemeToPreferences(isDark);
  }

  Future<void> loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }

  Future<void> saveThemeToPreferences(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }
}
