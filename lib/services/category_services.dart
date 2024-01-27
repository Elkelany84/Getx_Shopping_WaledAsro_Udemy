import 'package:http/http.dart' as http;
import 'package:waleed_asro_shopping_getx_api/model/category_model.dart';
import 'package:waleed_asro_shopping_getx_api/utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getCategories() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelsFromJson(jsonData);
    } else {
      return throw Exception("Faild to load Categories!");
    }
  }
}
