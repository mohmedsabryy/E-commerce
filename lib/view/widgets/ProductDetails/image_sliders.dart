import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/logic/controllers/cart_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../routes/routes.dart';

class ImageSlider extends StatefulWidget {
final String imageurl;
  const ImageSlider({
  required this.imageurl,
    Key? key,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController=CarouselController();
  final cartController=Get.find<CartController>();
  int currentpage=0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 350,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index,reson){
                setState(() {
                  currentpage=index;
                });
              }
          ),
          itemBuilder:(context,index,realindex)
          {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image:NetworkImage(widget.imageurl),
                    fit: BoxFit.fill,
                  ),
                borderRadius: BorderRadius.circular(25),
                  ),
            );
          },
        ),
        Positioned(
            bottom: 30,
            left: 150,
            child: AnimatedSmoothIndicator(
              activeIndex: currentpage,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Get.isDarkMode?pinkClr:mainColor,
                dotColor: Colors.black,
              ),


            )
        ),
        Container(
          padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Get.back();
                },
                child:  Container(
                  padding: const EdgeInsets.all(8),
                  decoration:BoxDecoration(
                    color: Get.isDarkMode?pinkClr.withOpacity(0.8):mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ) ,
                  child:   Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_back_ios,
                      color: Get.isDarkMode?Colors.black:Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            Obx(()=>  Badge(
              position: BadgePosition.topEnd(top: -10, end: -10),
              animationDuration: const Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                cartController.quantity().toString(),
                style: const TextStyle(color: Colors.white),
              ),
              child: InkWell(
                onTap: (){
                  Get.toNamed(Routes.cartScreen);
                },
                child:  Container(
                  padding: const EdgeInsets.all(8),
                  decoration:BoxDecoration(
                    color: Get.isDarkMode?pinkClr.withOpacity(0.8):mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ) ,
                  child:  Icon(Icons.shopping_cart,
                    color: Get.isDarkMode?Colors.black:Colors.white ,
                    size: 20,
                  ),
                ),
              ),
            ),),
            ],
          ),

        ),

      ],
    );
  }
}
