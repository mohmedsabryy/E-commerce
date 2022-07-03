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
// To parse this JSON data, do
//
//     final productModels = productModelsFromJson(jsonString);


List<ProductModels> productModelsFromJson(String str) => List<ProductModels>.from(json.decode(str).map((x) => ProductModels.fromJson(x)));

String productModelsToJson(List<ProductModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModels {
  ProductModels({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  Category? category;
  String image;
  Rating rating;

  factory ProductModels.fromJson(Map<String, dynamic> json) => ProductModels(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: categoryValues.map![json["category"]],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": categoryValues.reverse![category],
    "image": image,
    "rating": rating.toJson(),
  };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
   required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String> ? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
