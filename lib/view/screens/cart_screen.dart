import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/cart_controller.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/cart/cart_product_card.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/cart/cart_total.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          appBar: AppBar(
            centerTitle: true,
            title: Text("Cart Items"),
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.clearAllProucts();
                  },
                  icon: Icon(Icons.backspace))
            ],
          ),
          body: Obx(() {
            if (controller.productsMap.isEmpty) {
              return EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 650,
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return CartProductCard(
                                quantity: controller.productsMap.values
                                    .toList()[index],
                                index: index,
                                productModels: controller.productsMap.keys
                                    .toList()[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: controller.productsMap.length),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          })),
    );
  }
}
