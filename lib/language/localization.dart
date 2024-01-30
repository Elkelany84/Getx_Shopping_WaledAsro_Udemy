import 'package:get/route_manager.dart';
import 'package:waleed_asro_shopping_getx_api/language/ar.dart';
import 'package:waleed_asro_shopping_getx_api/language/en.dart';
import 'package:waleed_asro_shopping_getx_api/language/fr.dart';
import 'package:waleed_asro_shopping_getx_api/utils/my_string.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
