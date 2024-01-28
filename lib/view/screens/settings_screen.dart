import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/auth_controller.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/settings/darkmode_widget.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/settings/logout_widget.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final AuthController controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          // ProfileImage()
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
            color: Get.isDarkMode ? Colors.white : Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          TextUtils(
              text: "GENERAL",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
              underLine: TextDecoration.none),
          SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          SizedBox(
            height: 20,
          ),
          // LanguagueWidget()
          SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
