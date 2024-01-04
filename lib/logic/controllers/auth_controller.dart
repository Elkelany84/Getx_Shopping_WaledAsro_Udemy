import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isChecked = false;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isChecked = !isChecked;
    update();
  }
}
