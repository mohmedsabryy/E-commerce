

import 'package:ecommerce/logic/controllers/category_controller.dart';
import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';


class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }

}