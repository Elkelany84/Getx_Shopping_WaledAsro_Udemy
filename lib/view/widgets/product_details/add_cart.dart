import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/cart_controller.dart';
import 'package:waleed_asro_shopping_getx_api/model/product_models.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/text_utils.dart';

class AddCart extends StatelessWidget {
  AddCart({super.key, required this.price, required this.productModels});
  final double price;

  final ProductModels productModels;
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: "Price",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underLine: TextDecoration.none),
              Text(
                "\$ $price",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 60,
            child: Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor),
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add To Cart',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                        )
                      ],
                    ))),
          )
        ],
      ),
    );
  }
}
