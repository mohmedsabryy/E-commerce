import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/cart/cart_total.dart';
import 'package:ecommerce/view/widgets/cart/empty_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/cart_controller.dart';
import '../widgets/cart/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text("Cart Items"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProductFromCart();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx((){
          if(controller.productsMap.length==0){
            return EmptyCart();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                SizedBox(
                  height: screenHeight - 170,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CartProductCard(
                      model: controller.productsMap.keys.toList()[index],

                      quantity: controller.productsMap.values.toList()[index],
                    ),
                    separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                    itemCount: controller.productsMap.length,
                  ),
                ),
                CartTotal(),
              ],
            ),
          );
        },),
      ),
    );
  }
}
