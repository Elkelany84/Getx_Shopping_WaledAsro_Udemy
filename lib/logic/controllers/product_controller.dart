import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/model/product_models.dart';

import '../../services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  getProducts() async {
    var products = await ProductServices.getProducts();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //Logic for Favourites Screen
}
