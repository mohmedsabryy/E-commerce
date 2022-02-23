import 'package:ecommerce/logic/controllers/main_controller.dart';
import 'package:ecommerce/logic/controllers/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final String rate;
  final String descreption;
  ClothesInfo ({
  required this.title,
   required this.rate,
    required this.descreption,
    Key? key,
  }) : super(key: key);
  final controller=Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                  ),
                ),
              ),
           Container(
             padding:  EdgeInsets.all(8),
             decoration: BoxDecoration(
               color: Get.isDarkMode?Colors.white.withOpacity(0.4): Colors.grey.withOpacity(0.4),
               shape: BoxShape.circle,
             ),
             child: InkWell(
               onTap: (){},
               child: Icon(
                  Icons.favorite,
                 color: Colors.red,
                 size: 20,),
             ),
           ),
            ],
          ),
          Row(
            children: [
              TextUtils(text: rate, fontsize: 14, fontWeight: FontWeight.bold, color: Get.isDarkMode?Colors.white:Colors.black, underline: TextDecoration.none,),
            const SizedBox(width: 8),
      RatingBar.builder(
        initialRating: double.parse(rate),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),

            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
         descreption ,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",
            trimMode: TrimMode.Line,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?pinkClr:mainColor,
            ),
            moreStyle:TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?pinkClr:mainColor,
            ),
              style: TextStyle(
                fontSize: 16,
                height: 2,
                color: Get.isDarkMode?Colors.white:Colors.black,
              ),
          )
        ],
      ),
    );
  }
}
