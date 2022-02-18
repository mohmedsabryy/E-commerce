import 'dart:convert';

import 'package:ecommerce/utils/config.dart';
import 'package:http/http.dart' as http;

import '../models/products_models.dart';
class ProductServices{

  static Future<List<ProductModel>> getAllProduct()async{

//http://192.168.1.3/ecommerce/api/product/get_all_products.php?token=m
     String url =apiPath + "product/get_all_products.php?token="+ token;

    var response = await http.get(Uri.parse(url));

     print({response.statusCode});
     if (response.statusCode==200) {

       print("success");
       print("product data => ${response.body}");

      return productModelFromJson(response.body);
     }

     else {
       print("failed");
      return throw Exception("Failed to load the products...");
       //return [];
     }
  }

}