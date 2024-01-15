import 'package:http/http.dart' as http;
import 'package:waleed_asro_shopping_getx_api/model/product_models.dart';
import 'package:waleed_asro_shopping_getx_api/utils/my_string.dart';

class ProductServices {
  static Future<List<ProductModels>> getProducts() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception("Faild to load Products!");
    }
  }
}
