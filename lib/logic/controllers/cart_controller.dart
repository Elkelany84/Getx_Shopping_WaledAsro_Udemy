import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/model/product_models.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
      // print(productsMap.entries.map((e) => e.key.price * e.value).toList());
      // print(productsMap.entries
      //     .map((e) => e.key.price * e.value)
      //     .toList()
      //     .reduce((value, element) => value + element)
      //     .toStringAsFixed(2));

      // print(productsMap.value.toString());
    } else {
      productsMap[productModels] = 1;
      // print(productsMap.entries.map((e) => e.key.price * e.value).toList());
      // print(productsMap.entries
      //     .map((e) => e.key.price * e.value)
      //     .toList()
      //     .reduce((value, element) => value + element)
      //     .toStringAsFixed(2));
      // print(productsMap.value.toString());
    }
  }

  //Count down same product from 10 to 1 then remove it
  void removeProductsFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  //the red basket button
  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProucts() {
    Get.defaultDialog(
      title: "Clear Shopping Basket!",
      titleStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      middleText: "Are you sure you want to Clear The Basket?",
      middleTextStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      backgroundColor: Colors.grey,
      cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      radius: 10,
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
