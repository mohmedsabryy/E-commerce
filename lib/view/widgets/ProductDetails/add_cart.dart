import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/models/products_models.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddCart extends StatelessWidget {
  final double price;
  final ProductModel productModels;
   AddCart({
   required this.price,
    required this.productModels,
    Key? key
  }) : super(key: key);
final controller=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              TextUtils(text: "price", fontsize: 16, fontWeight: FontWeight.bold, color: Colors.grey, underline: TextDecoration.none),
              Text("\$$price",style: TextStyle(
                color:Get.isDarkMode?Colors.white:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),),

            ],
          ),
          const SizedBox(width: 20,),
          Expanded(
            child:SizedBox(
              height: 60,
            child:ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                primary: Get.isDarkMode?Colors.pink:mainColor,
              ),
              onPressed: (){
                controller.addProductToCard(productModels);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
            children:const [
              Text("Add  to Cart",style:TextStyle(
                color:Colors.white,
                fontSize: 20,

              ) ,),
              SizedBox(width: 10),
              Icon(Icons.shopping_cart_outlined),
            ],
          ),),
            )
          )
        ],
      ),
    );
  }
}
