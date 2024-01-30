import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/auth_controller.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
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
                cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
                radius: 10,
                textCancel: "No",
                textConfirm: "Yes",
                confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
                onCancel: () {
                  Get.back();
                },
                onConfirm: () {
                  controller.signOutFromApp();
                },
                buttonColor: Get.isDarkMode ? pinkClr : mainColor,
              );
            },
            splashColor: Get.isDarkMode
                ? pinkClr.withOpacity(0.6)
                : mainColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
            customBorder: StadiumBorder(),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: logOutSettings),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                TextUtils(
                    text: "Logout".tr,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none)
              ],
            ),
          ));
    });
  }
}
