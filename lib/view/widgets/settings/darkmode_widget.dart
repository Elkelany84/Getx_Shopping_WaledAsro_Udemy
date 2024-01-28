import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/settings_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/theme_controller.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            // activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            // inactiveThumbColor: Get.isDarkMode ? Colors.white : Colors.black,
            value: controller.switchValue.value,
            onChanged: (value) {
              ThemeController().changesTheme();
              controller.switchValue.value = value;
            },
          ),
        ],
      );
    });
  }

  Widget buildIconWidget() {
    return Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: darkSettings),
              child: Icon(
                Icons.dark_mode,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextUtils(
                text: "DarkMode",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none)
          ],
        ));
  }
}
