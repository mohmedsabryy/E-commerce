import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/models/products_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class CardItems extends StatelessWidget {
   CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Obx((){
      if(controller.isLoading.value){
        return  Center(child: CircularProgressIndicator(
          color: Get.isDarkMode? pinkClr: mainColor,
        ));
      }else {
        return  Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.products.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: screenWidth/screenHeight,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context,index){
              return buildCardItems(product: controller.products[index]);
            },
          ),
        );
      }
    });
  }

  Widget buildCardItems({
  required ProductModel product,
}){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,

            ),
          ],
        ),
        child:Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Colors.black,
                    ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
              product.productImage,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    '\$${product.productPrice}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 3,
                        right: 2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // rate
                          TextUtils(
                            text: product.productRate,
                            fontsize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            underline: TextDecoration.none,
                          ),
                          Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}
