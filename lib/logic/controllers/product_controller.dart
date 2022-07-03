import 'package:ecommerce/models/products_models.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  //.obs for stream data
  var products = <ProductModels>[].obs;
  var favorites = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  // for search
  var searchList = <ProductModels>[].obs;
  TextEditingController search = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getProducts();

    List? favList = storage.read<List>("isFavoritesList");
    if (favList != null) {
      favorites = favList.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
  }

  void getProducts() async {
    var allProducts = await ProductServices.getAllProduct();
    try {
      isLoading(true);
      if (allProducts.isNotEmpty) {
        products.addAll(allProducts);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorites(var _id) async {
    int index = favorites.indexWhere((element) => element.id == _id);
    if (index >= 0) {
      favorites.removeAt(index);
      await storage.remove("isFavoritesList");
    } else {
      var _model = products.firstWhere((element) => element.id == _id);
      favorites.add(_model);
      await storage.write("isFavoritesList", favorites);
    }
  }

  bool isFavorite(var _id) {
    return favorites.any((element) => element.id == _id);
  }

  // logic for search bar
  void addSearchToList(String searchName) {
  searchName=searchName.toLowerCase();

    searchList.value = products.where((search) {
      var searchTitle=search.title.toLowerCase();
      return searchTitle.contains(searchName) ||
          search.price.toString().contains(searchName.toLowerCase());
    }).toList();

    update();
  }

  void clearSearch() {
    search.clear();
    addSearchToList("");
  }
}
