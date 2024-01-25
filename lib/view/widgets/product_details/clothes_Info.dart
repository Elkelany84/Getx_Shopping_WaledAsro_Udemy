import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/product_controller.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class ClothesInfo extends StatelessWidget {
  ClothesInfo(
      {super.key,
      required this.title,
      required this.productId,
      required this.rate});
  final String title;
  final int productId;
  final double rate;
  // late double _rating;
  ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(() {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4)),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(productId);
                    },
                    child: controller.isFavourites(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          ),
                  ),
                );
              })
            ],
          ),
          Row(
            children: [
              TextUtils(
                  text: "$rate",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(
                width: 8,
              ),
              RatingBar(
                  minRating: 1,
                  maxRating: 5,
                  initialRating: rate,
                  allowHalfRating: true,
                  ratingWidget: RatingWidget(
                    full: Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                    ),
                    half: Icon(Icons.star, color: Colors.grey),
                    empty: Icon(Icons.star, color: Colors.grey),
                  ),
                  onRatingUpdate: (_rating) {
                    _rating = rate;
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
