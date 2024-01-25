import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/cart_controller.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';
import 'package:waleed_asro_shopping_getx_api/view/widgets/product_details/color_picker.dart';

class ImageSliders extends StatefulWidget {
  const ImageSliders({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();
  CartController cartController = Get.find<CartController>();
  int currentPage = 0;
  int currentColor = 0;
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor2,
    kCOlor3,
    kCOlor4,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 2),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage = index;
                  });
                }),
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imageUrl), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(25)),
              );
            },
          ),
          Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              count: 3,
              activeIndex: currentPage,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                  dotColor: Colors.black),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 200,
              width: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30)),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentColor = index;
                        });
                      },
                      child: ColorPicker(
                          outerBorder: currentColor == index,
                          color: colorSelected[index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 3,
                    );
                  },
                  itemCount: colorSelected.length),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  return badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -14, end: -12),

                    badgeAnimation: badges.BadgeAnimation.slide(
                      disappearanceFadeAnimationDuration:
                          Duration(milliseconds: 200),
                      // curve: Curves.easeInCubic,
                    ),
                    // showBadge: _showCartBadge,
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.red,
                    ),
                    badgeContent: Text(
                      {cartController.quantity()}.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Get.isDarkMode
                              ? pinkClr.withOpacity(0.8)
                              : mainColor.withOpacity(0.8),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
