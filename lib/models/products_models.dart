// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productDesc,
    required this.productImage,
    required this.productQuantity,
    required this.productRate,
    required this.productDiscount,
    required this.categoryId,
  });

  var productId;
  var productName;
  var productPrice;
  var productDesc;
  var productImage;
  var productQuantity;
  var productRate;
  var productDiscount;
  var categoryId;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productDesc: json["product_descreption"],
        productImage: json["product_image"],
        productQuantity: json["product_quantity"],
        productRate: json["product_rate"],
        productDiscount: json["product_discount"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "product_descreption": productDesc,
        "product_image": productImage,
        "product_quantity": productQuantity,
        "product_rate": productRate,
        "product_discount": productDiscount,
        "category_id": categoryId,
      };
}
