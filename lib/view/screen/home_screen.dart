import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/home/search_text_form.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/card_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? darkGreyClr : mainColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                            text: 'Find Your',
                            fontsize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            underline: TextDecoration.none,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextUtils(
                          text: 'INSPIRATION',
                          fontsize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          underline: TextDecoration.none,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SearchFormText(),


                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextUtils(
                      text: 'Categories',
                      fontsize: 20,
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? Colors.white : Colors.black ,
                      underline: TextDecoration.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardItems(),
                ),
              ],
            ),
          ),

        ),
    );
  }
}
