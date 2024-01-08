import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/category_screen.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/favourites_screen.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/home_screen.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ].obs;

  final title = ["Elkelan Shop", "Categories", "Favorites", "Settings"].obs;
}
