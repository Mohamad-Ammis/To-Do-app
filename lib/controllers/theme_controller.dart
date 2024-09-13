
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/theme/dark_theme.dart';
import 'package:to_do_app/theme/light_theme.dart';

class ThemeController extends GetxController with WidgetsBindingObserver {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPreferences();
    WidgetsBinding.instance
        .addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance
        .removeObserver(this); 
    super.onClose();
  }

  @override
  void didChangePlatformBrightness() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    bool isDark = brightness == Brightness.dark;
    toggleTheme(isDark); 
  }

  void toggleTheme(bool isDark) {
    isDarkMode.value = isDark;
    Get.changeTheme(isDark ? darkTheme : lightTheme);
    saveThemeToPreferences(isDark);
  }

  Future<void> loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('isDarkMode')) {
      isDarkMode.value = prefs.getBool('isDarkMode')!;
    } else {
      var brightness = WidgetsBinding.instance.window.platformBrightness;
      isDarkMode.value = brightness == Brightness.dark;
    }

    Get.changeTheme(isDarkMode.value ? darkTheme : lightTheme);
  }

  Future<void> saveThemeToPreferences(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }
}
