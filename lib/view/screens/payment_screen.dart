import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/cart_controller.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/payment/delivery_container_widget.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/payment/payment_method_widget.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment"),
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: "Shipping to",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 20,
              ),
              DeliveryContainerWidget(),
              SizedBox(
                height: 20,
              ),
              TextUtils(
                  text: "Payment Method",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                height: 20,
              ),
              PaymentMethodWidget(),
              SizedBox(
                height: 30,
              ),
              //Total Button
              Center(
                child: TextUtils(
                    text: "${controller.total}  \$",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Get.isDarkMode ? pinkClr : mainColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                          fontSize: 22,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
