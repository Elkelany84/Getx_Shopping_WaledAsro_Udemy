import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waleed_asro_shopping_getx_api/model/product_models.dart';

import '../../services/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  // var isFavourites = false.obs;
  var favouritesList = <ProductModels>[].obs;

  var storage = GetStorage();

  @override
  void onInit() {
    List? storedFavourites = storage.read<List>("isFavouriteList");
    if (storedFavourites != null) {
      favouritesList =
          storedFavourites.map((e) => ProductModels.fromJson(e)).toList().obs;
      print(favouritesList);
      update();
    }
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

  // void addFavourites() {
  //   isFavourites.value = !isFavourites.value;
  // }

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storage.remove("isFavouriteList");
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavouriteList", favouritesList);
    }
  }

  // void addFavourites(int productId) {
  //   favouritesList
  //       .add(productList.firstWhere((element) => element.id == productId));
  // }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }
}
