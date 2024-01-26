import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/cart_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/product_controller.dart';
import 'package:waleed_asro_shopping_getx_api/model/product_models.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/product_details_screen.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class CardItems extends StatelessWidget {
  CardItems({super.key});
  final controller = Get.put(ProductController());
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(
          color: Get.isDarkMode ? pinkClr : mainColor,
        ));
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset("assets/images/search_empty_dark.png")
                  : Image.asset("assets/images/search_empty_light.png")
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 6,
                      maxCrossAxisExtent: 200),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItems(
                          image: controller.productList[index].image,
                          price: controller.productList[index].price,
                          rating: controller.productList[index].rating.rate,
                          productId: controller.productList[index].id,
                          productModels: controller.productList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModels: controller.productList[index],
                                ));
                          });
                    } else {
                      return buildCardItems(
                          image: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rating: controller.searchList[index].rating.rate,
                          productId: controller.searchList[index].id,
                          productModels: controller.searchList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModels: controller.searchList[index],
                                ));
                          });
                    }
                  }),
        );
      }
    });
  }

  Widget buildCardItems(
      {required String image,
      required double price,
      required double rating,
      required int productId,
      required ProductModels productModels,
      required Function() onTap}) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                15,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5),
              ]),
          child: Column(
            children: [
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.manageFavourites(productId);
                        },
                        icon: controller.isFavourites(productId)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartController.addProductToCart(productModels);
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 2, left: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                                text: "$rating",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                underLine: TextDecoration.none),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
