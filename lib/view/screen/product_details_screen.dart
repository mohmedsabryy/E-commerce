import 'package:ecommerce/models/products_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/ProductDetails/add_cart.dart';
import '../widgets/ProductDetails/clothes_info.dart';
import '../widgets/ProductDetails/image_sliders.dart';
import '../widgets/ProductDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;

  const ProductDetailsScreen({required this.productModels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(
              imageurl: productModels.image,
            ),
            ClothesInfo(
              title: productModels.title,
              rate: productModels.rating.rate.toString(),
              descreption: productModels.description,
            ),
            if (productModels.category == '1' ||
                productModels.category == '2')
              SizeList(),
            AddCart(
              price: productModels.price,
              productModels: productModels,
            ),
          ],
        ),
      ),
    );
  }
}
