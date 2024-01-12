import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/auth_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/theme_controller.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changesTheme();
              },
              child: Text(
                "Dark Mode",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(builder: (_) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "LogOut From App!",
                    titleStyle: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    middleText: "Are you sure you want to logout?",
                    middleTextStyle: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.grey,
                    cancelTextColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    radius: 10,
                    textCancel: "No",
                    textConfirm: "Yes",
                    confirmTextColor:
                        Get.isDarkMode ? Colors.white : Colors.black,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.signOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                },
                child: Text(
                  "LogOut",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
