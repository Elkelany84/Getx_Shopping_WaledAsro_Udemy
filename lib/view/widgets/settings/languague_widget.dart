import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/utils/my_string.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class LanguagueWidget extends StatelessWidget {
  const LanguagueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: languageSettings),
                child: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextUtils(
                  text: "Language",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
            ],
          ),
        ),
        Container(
          width: 120,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black, width: 2),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              onChanged: (value) {
                ene = value!;
              },
              items: [
                DropdownMenuItem(
                  value: ene,
                  child: Text(
                    english,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                DropdownMenuItem(
                  value: ara,
                  child: Text(
                    arabic,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                DropdownMenuItem(
                  value: frf,
                  child: Text(
                    france,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
              value: ene,
            ),
          ),
        )
      ],
    );
  }
}
