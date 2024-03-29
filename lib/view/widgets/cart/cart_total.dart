import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/cart_controller.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    //You Can add the whole container to obx
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: "Total",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 10,
              ),
              Text(
                "\$ ${controller.total}",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    backgroundColor: Get.isDarkMode ? pinkClr : mainColor),
                onPressed: () {
                  Get.toNamed(Routes.paymentScreen);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check Out",
                      style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
