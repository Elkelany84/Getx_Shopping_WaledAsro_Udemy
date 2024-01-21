import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/model/product_models.dart';

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
    productsMap.clear();
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
