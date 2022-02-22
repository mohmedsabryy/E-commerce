import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      text: "Total",
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      underline: TextDecoration.none,
                    ),
                    Text(
                      "\$${controller.totalPrice}",
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        primary: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Check Out",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.shopping_cart),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
