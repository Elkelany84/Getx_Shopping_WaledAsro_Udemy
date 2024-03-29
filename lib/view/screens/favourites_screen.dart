import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/product_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Obx(
        () {
          if (controller.favouritesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/heart.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Please add Your Favorites Products!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return buildFavItems(
                    title: controller.favouritesList[index].title,
                    price: controller.favouritesList[index].price,
                    image: controller.favouritesList[index].image,
                    productId: controller.favouritesList[index].id,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
                itemCount: controller.favouritesList.length);
          }
        },
      ),
    );
  }

  Widget buildFavItems(
      {required String title,
      required double price,
      required String image,
      required int productId}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                controller.manageFavourites(productId);
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
