import 'package:ecommerce/models/products_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCard(ProductModel model) {
    if (productsMap.containsKey(model)) {
      productsMap[model] += 1;
    } else {
      productsMap[model] = 1;
    }

    Get.snackbar(
      "Added To Cart",
      "product added to car successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void removeProductFromCard(ProductModel model) {
    productsMap.removeWhere((key, value) => key == model);
  }

  void removeOneProductFromCard(ProductModel model) {
    if (productsMap.containsKey(model) && productsMap[model] == 1) {
      productsMap.removeWhere((key, value) => key == model);
    } else {
      productsMap[model] -= 1;
    }
  }

  void clearAllProductFromCart() {
    Get.defaultDialog(
      title: "Clear All Products",
      titleStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.black,
      ),
      middleText: " are you sure you need clear all products ? ",
      middleTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      radius: 10,
      textCancel: " No ",
      textConfirm: " Yes ",
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.black,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get totalPrice => productsMap.entries
      .map((e) => double.parse(e.key.productPrice) * e.value)
      .toList()
      .reduce((value, element) => value + element);

  int quantity() {
    if(productsMap.isEmpty){
      return 0;
    }
    return productsMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
  }
}
