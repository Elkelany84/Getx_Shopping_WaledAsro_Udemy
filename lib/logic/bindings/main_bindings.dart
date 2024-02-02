import 'package:get/get.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/main_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/payment_controller.dart';
import 'package:waleed_asro_shopping_getx_api/logic/controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PaymentController(), permanent: true);
  }
}
