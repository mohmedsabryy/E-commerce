import 'package:ecommerce/models/products_models.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';
import '../utils/my_string.dart';

class CategoryServices {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

class AllCategorySercvises {
  static Future<List<ProductModel>> getAllCatehory(String categoryNames) async {
    var response =
    await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}