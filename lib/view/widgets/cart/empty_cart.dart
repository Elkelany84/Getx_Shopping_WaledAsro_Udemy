import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Your Cart is ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Empty!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Add Items to get Started ",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              },
              child: Text(
                "Go to Home",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
