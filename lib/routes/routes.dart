import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/bindings/auth_binding.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/login_screen.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/signup_screen.dart';
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
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = "/welcomeScreen";
  static const loginScreen = "/loginScreen";
  static const signupScreen = "/signupScreen";
}
