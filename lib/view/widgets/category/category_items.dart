import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/cart_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/category_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/product_controller.dart';
import 'package:waleed_asro_shopping_getx_api/model/product_models.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/product_details_screen.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({super.key, required this.categoryTitle});
  final String categoryTitle;
  final controller = Get.put(ProductController());
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        title: Text(categoryTitle),
      ),
      body: Expanded(child: Obx(() {
        if (categoryController.isAllCategory.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return GridView.builder(
              itemCount: categoryController.categoryList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 6,
                  maxCrossAxisExtent: 200),
              itemBuilder: (context, index) {
                return buildCardItems(
                    image: categoryController.categoryList[index].image,
                    price: categoryController.categoryList[index].price,
                    rating: categoryController.categoryList[index].rating.rate,
                    productId: categoryController.categoryList[index].id,
                    productModels: categoryController.categoryList[index],
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(
                            productModels:
                                categoryController.categoryList[index],
                          ));
                    });
              });
        }
      })),
    );
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
