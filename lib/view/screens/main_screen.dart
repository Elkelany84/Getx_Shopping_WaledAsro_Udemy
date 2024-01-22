import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/cart_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/main_controller.dart';
import 'package:waleed_asro_shopping_getx_api/routes/routes.dart';
import 'package:waleed_asro_shopping_getx_api/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainController controller = Get.find<MainController>();
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          leading: Container(),
          actions: [
            Obx(() {
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: -3, end: 0),

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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    icon: Image.asset("assets/images/shop.png"),
                  ),
                ),
              );
            })
          ],
          centerTitle: true,
          title: Text(controller.title[controller.currentIndex.value]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ""),
          ],
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
