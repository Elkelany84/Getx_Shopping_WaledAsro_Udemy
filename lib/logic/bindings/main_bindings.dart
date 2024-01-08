import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
