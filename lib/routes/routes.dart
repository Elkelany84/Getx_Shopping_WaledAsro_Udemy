import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/welcome_screen.dart';

class AppRoutes {
  //initial route
  static const welcome = Routes.welcomeScreen;

//getPages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = "/welcomeScreen";
}
