import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/models/products_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,

      body: Obx(
        () {
          if (controller.favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/heart.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Please, Add your favourite products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }
          else {
            return ListView.separated(
              itemBuilder: (context,index){
                return buildFavItems(controller.favorites[index]);
              },
              separatorBuilder:(context,index){
                return Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favorites.length,
            );
          }
        },
      ),
    );
  }

  Widget buildFavItems(ProductModel model) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    model.productImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.productName,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${ model.productPrice.toString()}',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.manageFavorites(model.productId);
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
