import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/cart/cart_product_card.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/cart/cart_total.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CartProductCard();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 1),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CartTotal(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
