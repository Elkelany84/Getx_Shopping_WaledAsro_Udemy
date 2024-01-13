import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/home/search_text_from.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        text: "Find Your",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underLine: TextDecoration.none),
                    SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                        text: "Inspiration",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underLine: TextDecoration.none),
                    SizedBox(
                      height: 20,
                    ),
                    SearchFromText()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
