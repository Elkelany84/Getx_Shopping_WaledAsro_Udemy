import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/bindings/auth_binding.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/forget_password.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/login_screen.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/auth/signup_screen.dart';
import 'package:waleed_asro_shopping_getx_api/view/screens/main_screen.dart';
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
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetpasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        binding: AuthBinding()),
  ];
}

class Routes {
  static const welcomeScreen = "/welcomeScreen";
  static const loginScreen = "/loginScreen";
  static const signupScreen = "/signupScreen";
  static const forgetPasswordScreen = "/forgetpasswordScreen";
  static const mainScreen = "/mainScreen";
}
