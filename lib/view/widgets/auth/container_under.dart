import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  const ContainerUnder(
      {super.key,
      required this.text,
      required this.textType,
      required this.onPressed});
  final String text, textType;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onPressed,
              child: Text(
                textType,
                style: TextStyle(decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }
}
