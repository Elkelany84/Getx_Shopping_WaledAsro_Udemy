import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/auth_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/settings_controller.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});
  final controller = Get.find<SettingsController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        authController.displayUserPhoto.value,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      text: controller
                          .capitalize(authController.displayUserName.value),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none),
                  TextUtils(
                      text: authController.displayUserEmail.value,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      underLine: TextDecoration.none),
                ],
              ),
            ],
          );
        })
      ],
    );
  }
}
