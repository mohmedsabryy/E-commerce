import 'dart:convert';

import 'package:ecommerce/utils/config.dart';
import 'package:http/http.dart' as http;

import '../models/products_models.dart';
class ProductServices{

  static Future<List<ProductModel>> getAllProduct()async{

//http://192.168.1.3/ecommerce/api/product/get_all_products.php?token=m
     String url =apiPath + "product/get_all_products.php?token="+ token;

    var response = await http.get(Uri.parse(url));

     if (json.decode(response.body)["code"] == "200") {

       var productsData=json.decode(response.body)["message"];
       print("success");
       print("product message => $productsData");
       //ProductModel.fromJson(jsonData);
      return productModelFromJson(productsData);
     }

     else if(json.decode(response.body)["message"] == "empty"){
       print("there is no products ...");
       return [];
     }
     else {
       print("failed");
       return throw Exception("Failed to load the products...");
     }
  }

}