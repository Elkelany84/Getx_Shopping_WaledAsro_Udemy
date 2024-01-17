import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.backspace))],
        ),
        body: EmptyCart(),
      ),
    );
  }
}
