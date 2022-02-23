import 'package:ecommerce/models/products_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/ProductDetails/add_cart.dart';
import '../widgets/ProductDetails/clothes_info.dart';
import '../widgets/ProductDetails/image_sliders.dart';
import '../widgets/ProductDetails/size_list.dart';
class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModels;
  const ProductDetailsScreen({
  required this.productModels,
  Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(imageurl: productModels.productImage,),
           ClothesInfo(title: productModels.productName,rate: productModels.productRate.toString(),descreption: productModels.productDesc,),
          if(productModels.categoryId=='1'||productModels.categoryId=='2') SizeList(),
            AddCart(price: double.parse(productModels.productPrice),productModels: productModels,),
          ],
        ),
      ) ,
    );
  }
}
