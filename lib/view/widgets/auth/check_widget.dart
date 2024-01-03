import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Get.isDarkMode
                ? Image.asset("assets/images/check.png")
                : Icon(
                    Icons.done,
                    color: pinkClr,
                    size: 30,
                  ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Row(
          children: [
            TextUtils(
                text: "I Accept ",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underLine: TextDecoration.none),
            TextUtils(
                text: "Terms & Conditions ",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underLine: TextDecoration.none),
          ],
        )
      ],
    );
  }
}
