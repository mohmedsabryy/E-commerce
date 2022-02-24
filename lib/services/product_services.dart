import 'dart:convert';

import 'package:ecommerce/utils/config.dart';
import 'package:http/http.dart' as http;

import '../models/products_models.dart';
class ProductServices{

  static Future<List<ProductModel>> getAllProduct()async{
List<ProductModel> products;
//http://192.168.1.3/ecommerce/api/product/get_all_products.php?token=m
     String url =apiPath + "product/get_all_products.php?token="+ token;
     String myUrl="http://172.19.80.1/ecommerce/api/product/getAllProducts.php?token=m";

    var response = await http.get(Uri.parse(myUrl));

     print({response.statusCode});
     if (response.statusCode==200) {

       print("success");
       print("product data => ${response.body}");

      products= productModelFromJson(response.body);
      print("price type =>${products[0].productPrice.runtimeType}");
      print("price val =>${products[0].productPrice.toString()}");

      return products;

     }

     else {
       print("failed");
      return throw Exception("Failed to load the products...");
       //return [];
     }
  }

}