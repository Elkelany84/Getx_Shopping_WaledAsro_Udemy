import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = "isDarkMode";
  saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
    // print(boxStorage.read('isDarkMode'));
  }

  bool getThemeDataFromBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    // Get.isDarkMode
    //     ? Get.changeThemeMode(ThemeMode.light)
    //     : Get.changeThemeMode(ThemeMode.dark);
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
